#!/bin/bash

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=200GB
#SBATCH --job-name="build_db_kraken2"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/build_db_kraken2.output
#SBATCH --mail-user=mikeph526@outlook.com
#SBATCH --mail-type=ALL
#SBATCH --time=48:00:00

DB=/home1/mikeph/data/kraken2_db
DEST=/home1/mikeph/data/kraken2_db/db
THREADS=20

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

# Fix locale warnings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

echo "$(date): Adding sequences to library started"

# Enable recursive globbing and find all fna files
shopt -s globstar
for fna in "$DEST"/**/*.fna; do
    [ -f "$fna" ] || continue   # skip if no files matched
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

echo "Job finished at: $(date)"