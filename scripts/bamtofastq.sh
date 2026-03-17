#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=40000              
#SBATCH --job-name="bamtofastq"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/samtools/bamtofastq.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DATA=/home1/mikeph/data/hifi_reads/Cal_mix.hifi_reads.bam

samtools fastq -@ 20 "$DATA" | bgzip -@ 20 > Cal_mix.fastq.gz
