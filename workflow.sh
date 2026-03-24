#!/bin/bash

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=200GB              
#SBATCH --job-name="kraken2"
#SBATCH --output=logs/kraken2/kraken2.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db/library/added
FASTQ=/home1/mikeph/data/hifi_reads/Cal_mix.fastq.gz

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

set -euo pipefail

kraken2 \
  --db "$DB" \
  --threads 20 \
  --output results/kraken2/dec.kraken2.output \
  --report results/kraken2/dec.kraken2.report \
  --gzip-compressed "$FASTQ"
