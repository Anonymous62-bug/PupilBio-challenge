#!/usr/bin/bash

cd "../output/Norm/"
bam_file="bwa.bam"
echo $bam_file
cd "../output/Tumor/"
docker run -v /home/harini_prasanna/tumor:/gatk/tumor --rm broadinstitute/gatk gatk MarkDuplicates \
    --INPUT tumor/$bam_file \
    --OUTPUT tumor/dedup.${bam_file} \
    --METRICS_FILE tumor/${bam_file}.metrics.txt

docker run -v /home/harini_prasanna/tumor:/gatk/tumor --rm broadinstitute/gatk gatk SortSam \
     INPUT=tumor/dedup.${bam_file} \
     OUTPUT=tumor/sorted.${bam_file} \
     SORT_ORDER=coordinate
cd "../output/Norm/"
docker run -v /home/harini_prasanna/normal:/gatk/normal --rm broadinstitute/gatk gatk MarkDuplicates \
    --INPUT normal/$bam_file \
    --OUTPUT normal/dedup.${bam_file} \
    --METRICS_FILE normal/${bam_file}.metrics.txt
docker run -v /home/harini_prasanna/normal:/gatk/normal --rm broadinstitute/gatk gatk SortSam \
     INPUT=normal/dedup.${bam_file} \
     OUTPUT=normal/sorted.${bam_file} \
     SORT_ORDER=coordinate