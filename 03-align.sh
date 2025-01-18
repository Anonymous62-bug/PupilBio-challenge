#!/usr/bin/bash

cd "../output/Norm/"
r1=$(ls trimmed_*R1_001.fastq )
r2=$(ls trimmed_*R2_001.fastq )
instrument=$(head $r1 -n1 | cut -d":" -f 1 | sed 's/@//g')
flowcell=$(head $r1 -n1 | cut -d":" -f 3)
sample="PA221MH-lib09-P19-Norm"
#sample="PA220KH-lib09-P19-Tumor"
rg="@RG\tID:${flowcell}\tSM:${sample}\tPL:${instrument}\tPU:${flowcell}\tCN:Test"
bwa mem ../../reference/GCF_000001405.26_GRCh38_genomic.fna $r1 $r2 -t 6 -M -R $rg | samtools sort -O bam - >bwa.bam
samtools flagstat bwa.bam > flagstat.txt
