#!/usr/bin/bash

files=$(ls *.fastq)
for file in ${files[@]};do
    sample=$(echo $file | cut -d "_" -f1)
    tissue=$(echo $sample | cut -d "-" -f4)
    #echo $tissue
    cutadapt -g AGATCGGAAGAG -o output/${tissue}/trimmed_${file} ${file}
    echo ${file}
done
