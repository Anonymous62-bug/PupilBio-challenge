#!/usr/bin/bash

files=$(ls *_R1_001.fastq.gz)
for r1 in ${files[@]};do
    sample=$(echo $r1 | cut -d "_" -f1)
    tissue=$(echo $sample | cut -d "-" -f4)
    read=$(echo $r1 | cut -d "_" -f4)
    r2=$(echo ${r1} | sed 's/_R1/_R2/g')
    #echo $r2
    #echo $tissue
    fastqc -o "output/${tissue}" --extract ${r1} ${r2}
done