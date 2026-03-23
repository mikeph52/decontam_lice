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

unzip "$DB"/arthropoda/arthropoda.zip -d "$DEST"
unzip "$DB"/proteobacteria/proteobacteria.zip -d "$DEST"
unzip "$DB"/ciliophora/ciliophora.zip -d "$DEST"
unzip "$DB"/ascomycota/ascomycota.zip -d "$DEST"
unzip "$DB"/streptophyta/streptophyta.zip -d "$DEST"
unzip "$DB"/human/human.zip -d "$DEST"
unzip "$DB"/cnidaria/cnidaria.zip -d "$DEST"

echo "$(date):File extraction finished:"
echo "$(date):Rehydration started:"

datasets rehydrate --directory "$DEST"

echo "$(date):Rehydration finished:"
echo "Job finished at:$(date)"