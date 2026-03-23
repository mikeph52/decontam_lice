#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=45GB              
#SBATCH --job-name="unzip_rehydrate"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/unzip_rehydrate_2.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db
DEST=/home1/mikeph/data/kraken2_db/db

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "$(date): File extraction started"

for taxon in arthropoda proteobacteria ciliophora ascomycota streptophyta human cnidaria; do
    echo "  Unzipping ${taxon}..."
    unzip -o "$DB/${taxon}/${taxon}.zip" -d "$DEST"
done

echo "$(date): File extraction finished"
echo "$(date): Rehydration started"

datasets rehydrate --directory "$DEST" --no-progressbar

echo "$(date): Rehydration finished"
echo "Job finished at: $(date)"