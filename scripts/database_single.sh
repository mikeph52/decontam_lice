#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=20GB              
#SBATCH --job-name="k2_ciliophora"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/k2_ciliophora.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

# THIS IS A MODIFIED VERSION OF DATABASE.SH THAT INCLUDES ONLY THE CILIOPHORA DATASET
# NOTE! If you don't want STEP 3, run it on batch partition

DB=/home1/mikeph/data/kraken2_db/
THREADS=20

# if you gonna fail, at least do it in the start
set -euo pipefail

# for locale warnings - i don't know why
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi # for ncbi toolset and kraken2

# STEP 1: Download dehrydated datasets

echo "$(date): Creating directories on /home1/mikeph/data/kraken2_db."

mkdir -p "$DB"/ciliophora 

echo "$(date): Creating directories completed."
echo "$(date):Downloading dehrydated datasets from NCBI to /home1/mikeph/data/kraken2_db."

datasets download genome taxon 5878  --reference --dehydrated --filename "$DB"/ciliophora/ciliophora.zip  --no-progressbar    

echo "$(date):Dehydrated datasets saved succesfully in /home1/mikeph/data/kraken2_db."

# STEP 2: Unzip and rehydrate datasets
echo "$(date): File extraction started"

echo " Unzipping ciliophora..."
unzip -o "$DB/ciliophora/ciliophora.zip" -d "$DB/ciliophora/"

echo "$(date): Ciliophora extraction finished"
echo "$(date): Rehydration for ciliophora started"

datasets rehydrate --directory "$DB/ciliophora" --no-progressbar

echo "$(date): Rehydration for ciliophora finished"

echo "$(date): Total ciliophora dataset size calculation: "

DBSIZE="$(du -sh "$DB"/*)"

echo "$(date): Total ciliophora dataset size: ${DBSIZE}."
echo "$(date): Expected size: 13.8GB "

echo "Job finished at:$(date)"