#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=45GB              
#SBATCH --job-name="kraken2"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/kraken2.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

INPUT=/home1/mikeph/data/hifi_reads/Cal_mix.fastq.gz
DB= 

kraken2 