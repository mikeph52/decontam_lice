#!/bin/bash
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16GB
#SBATCH --job-name="download_arthropoda"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/download_arthropoda.output
#SBATCH --mail-user=mikeph526@outlook.com
#SBATCH --mail-type=ALL

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

DB=/home1/mikeph/data/kraken2_db

datasets download genome taxon 6656  --reference --filename "$DB"/arthropoda.zip --no-progressbar
