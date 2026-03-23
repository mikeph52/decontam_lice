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
TXT=/home1/mikeph/project_data/decontam_lice/misc/taxon.txt

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "$(date):Downloading dehrydated datasets from NCBI to /home1/mikeph/data/kraken2_db."

#datasets are dehydrated
#datasets download genome taxon 6656  --reference --dehydrated --filename "$DB"/arthropoda.zip --no-progressbar      
#datasets download genome taxon 1224  --reference --dehydrated --filename "$DB"/proteobacteria.zip --no-progressbar 
#datasets download genome taxon 5878  --reference --dehydrated --filename "$DB"/ciliophora.zip  --no-progressbar    
#datasets download genome taxon 4890  --reference --dehydrated --filename "$DB"/ascomycota.zip  --no-progressbar    
#datasets download genome taxon 33090 --reference --dehydrated --filename "$DB"/streptophyta.zip --no-progressbar   
#datasets download genome taxon 9606  --reference --dehydrated --filename "$DB"/human.zip --no-progressbar          
#datasets download genome taxon 6073  --reference --dehydrated --filename "$DB"/cnidaria.zip  --no-progressbar 

datasets download genome accession --inputfile "$TXT" --dehydrated --filename "$DB"/db.zip

echo "$(date):Dehrydated datasets saved succesfully in /home1/mikeph/data/kraken2_db."
echo "$(date):File extraction started:"

unzip "$DB"/db.zip -d "$DB"/db

echo "$(date):File extraction finished:"
echo "$(date):Rehydration started:"

datasets rehydrate --directory "$DB"/db/

echo "$(date):Rehydration finished:"
echo "Job finished at:$(date)"