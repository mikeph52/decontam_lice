#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=45GB              
#SBATCH --job-name="bamtofastq"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/samtools/bamtofastq.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DATA=/home1/mikeph/data/hifi_reads/Cal_mix.hifi_reads.bam
DIR=/home1/mikeph/data/hifi_reads/

echo "SORTING STARTED"
samtools sort -n -@ 20 -m 2G -o "$DIR"/Cal_mix_sorted.bam "$DATA"
echo "SORTING ENDED, CONVERSION STARTED"
samtools fastq -@ 10 "$DIR"/Cal_mix_sorted.bam | bgzip -@ 10 > "$DIR"/Cal_mix.fastq.gz
echo "CONVERTION ENDED"