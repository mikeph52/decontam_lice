#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=45GB              
#SBATCH --job-name="kraken2_db"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/download_db.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "$(date):Downloading databases for NCBI to /home1/mikeph/data/kraken2_db."

#Downloaded databases are commented out.
datasets download genome taxon 6656  --reference --filename "$DB"/arthropoda.zip      
#datasets download genome taxon 1224  --reference --filename "$DB"/proteobacteria.zip  
datasets download genome taxon 5878  --reference --filename "$DB"/ciliophora.zip      
datasets download genome taxon 4890  --reference --filename "$DB"/ascomycota.zip      
datasets download genome taxon 33090 --reference --filename "$DB"/streptophyta.zip    
#datasets download genome taxon 9606  --reference --filename "$DB"/human.zip           
datasets download genome taxon 6073  --reference --filename "$DB"/cnidaria.zip       

echo "$(date):Datasets saved succesfully in /home1/mikeph/data/kraken2_db."