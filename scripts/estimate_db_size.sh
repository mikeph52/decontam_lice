#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=20GB              
#SBATCH --job-name="est_db"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/misc/est_db.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

set -euo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi # for ncbi toolset and kraken2

echo "Searching estimated db size. . . "

datasets download genome taxon 6656 --dehydrated --preview --no-progressbar
datasets download genome taxon 1224 --dehydrated --preview --no-progressbar
datasets download genome taxon 5878 --dehydrated --preview --no-progressbar
datasets download genome taxon 4890 --dehydrated --preview --no-progressbar
datasets download genome taxon 33090 --dehydrated --preview --no-progressbar
datasets download genome taxon 9606 --dehydrated --preview --no-progressbar
datasets download genome taxon 6073 --dehydrated --preview --no-progressbar
datasets download genome taxon 6830 --dehydrated --preview --no-progressbar
datasets download genome taxon 7711 --dehydrated --preview --no-progressbar
datasets download genome taxon 4751 --dehydrated --preview --no-progressbar

echo "Searching estimated db size for reference genomes only. . . "

datasets download genome taxon 6656 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 1224 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 5878 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 4890 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 33090 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 9606 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 6073 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 6830 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 7711 --dehydrated --preview --reference --no-progressbar
datasets download genome taxon 4751 --dehydrated --preview --reference --no-progressbar

echo "Job finished at:$(date)"