#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=45GB              
#SBATCH --job-name="unzip&rehydrate"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/unzip&rehydrate.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db
DEST=/home1/mikeph/data/kraken2_db/db

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "$(date):File extraction started:"

unzip "$DB"/arthropoda/arthropoda.zip 
unzip "$DB"/proteobacteria/proteobacteria.zip 
unzip "$DB"/ciliophora/ciliophora.zip 
unzip "$DB"/ascomycota/ascomycota.zip 
unzip "$DB"/streptophyta/streptophyta.zip 
unzip "$DB"/human/human.zip 
unzip "$DB"/cnidaria/cnidaria.zip

echo "$(date):File extraction finished:"
echo "$(date):Rehydration started:"

datasets rehydrate --directory --no-progressbar  "$DB"

echo "$(date):Rehydration finished:"
echo "Job finished at:$(date)"