#!/bin/bash

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=200GB              
#SBATCH --job-name="k2_db_3"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/k2_db_3.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

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

mkdir -p "$DB"/pseudomonadota "$DB"/ciliophora "$DB"/ascomycota "$DB"/dicenthrachus_labrax "$DB"/posidonia_oceanica "$DB"/human
echo "$(date): Creating directories completed."
echo "$(date):Downloading dehrydated datasets from NCBI to /home1/mikeph/data/kraken2_db."

# remove this
Pseudomonadota	1224
Ciliophora	5878
Ascomycota	4890
"Dicentrarchus labrax
"	13489
Homo sapiens	9606
Posidonia oceanica	55489
#

datasets download genome taxon 1224 --reference --dehydrated --filename "$DB"/pseudomonadota/pseudomonadota.zip --no-progressbar
datasets download genome taxon 5878 --reference --dehydrated --filename "$DB"/ciliophora/ciliophora.zip --no-progressbar
datasets download genome taxon 4890 --reference --dehydrated --filename "$DB"/ascomycota/ascomycota.zip --no-progressbar
datasets download genome taxon 13489 --reference --dehydrated --filename "$DB"/dicenthrachus_labrax/dicenthrachus_labrax.zip --no-progressbar
datasets download genome taxon 9606 --reference --dehydrated --filename "$DB"/human/human.zip --no-progressbar
datasets download genome taxon 55489 --reference --dehydrated --filename "$DB"/posidonia_oceanica/posidonia_oceanica.zip --no-progressbar

echo "$(date):Dehydrated datasets saved succesfully in /home1/mikeph/data/kraken2_db."

# STEP 2: Unzip and rehydrate datasets
echo "$(date): File extraction started"

for taxon in pseudomonadota ciliophora ascomycota dicenthrachus_labrax human posidonia_oceanica; do
    echo "  Unzipping ${taxon}..."
    unzip -o "$DB/${taxon}/${taxon}.zip" -d "$DB/${taxon}/"

    echo "$(date): ${taxon} extraction finished"
    echo "$(date): Rehydration for ${taxon} started"

    datasets rehydrate --directory "$DB/${taxon}" --no-progressbar

    echo "$(date): Rehydration for ${taxon} finished"
done

# STEP 3: Built the databse, the rest are kraken2 stuff
echo "$(date): Adding sequences to library started"

shopt -s globstar # <--- enables global star
for fna in "$DB"/**/*.fna; do
    [ -f "$fna" ] || continue
    echo "  Adding: $fna"
    kraken2-build --add-to-library "$fna" --db "$DB" --threads "$THREADS"
done

echo "$(date): Adding sequences to library finished"
echo "$(date): Downloading taxonomy started"

kraken2-build --download-taxonomy --db "$DB" --use-ftp

echo "$(date): Downloading taxonomy finished"
echo "$(date): Building database started"

kraken2-build --build --db "$DB" --threads "$THREADS"

echo "$(date): Building database finished"

echo "$(date): Cleaning up intermediate files"
kraken2-build --clean --db "$DB"

echo "Job finished at:$(date)"