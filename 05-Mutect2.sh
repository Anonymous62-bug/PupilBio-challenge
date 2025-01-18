#!/usr/bin/bash

cd "../output/Tumor/"
docker run -v /home/harini_prasanna/tumor:/gatk/tumor --rm broadinstitute/gatk gatk CreateSequenceDictionary \
    -R tumor/GCF_000001405.26_GRCh38_genomic.fna\
    -O tumor/GCF_000001405.26_GRCh38_genomic.dict
docker run -v /home/harini_prasanna/tumor:/gatk/tumor --rm broadinstitute/gatk gatk Mutect2 \
    --input tumor/PA220KH-lib09-P19-Tumor.bam \
    --normal-sample tumor/PA221MH-lib09-P19-Norm.bam \
    --output tumor/variants.vcf \
    --reference tumor/GCF_000001405.26_GRCh38_genomic.fna
