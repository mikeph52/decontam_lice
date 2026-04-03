#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=30GB              
#SBATCH --job-name="db_summary"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/db_summary/logs/db_summary.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

datasets summary genome taxon 6656 --as-json-lines | python summary.py