#!/bin/bash
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=40GB
#SBATCH --job-name="p7zip_kraken2_db"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/p7zip_db.output
#SBATCH --mail-user=mikeph526@outlook.com
#SBATCH --mail-type=ALL

source ~/miniconda3/etc/profile.d/conda.sh
conda activate utilities

DB=/home1/mikeph/data/kraken2_db

for zipfile in "$DB"/*.zip; do
    echo "$(date): Extracting $zipfile..."
    7za x "$zipfile" -o"$DB"/ -y && mv "$zipfile" "$DB"/archives/
    echo "$(date): Done with $zipfile."
done

echo "$(date): All extractions completed."
