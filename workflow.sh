#!/bin/bash

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=200GB              
#SBATCH --job-name="kraken2"
#SBATCH --output=logs/kraken2/kraken2.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db
FASTQ=/home1/mikeph/data/hifi_reads/Cal_mix.fastq.gz

set -euo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

kraken2 \
  --db "$DB" \
  --threads 20 \
  --confidence 0.1\
  --output results/kraken2/dec.kraken2_2.output \
  --report results/kraken2/dec.kraken2_2.report \
  --gzip-compressed "$FASTQ"
