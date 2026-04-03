#!/bin/bash

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=200GB              
#SBATCH --job-name="k2-db_std"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/kraken2/k2-db_std.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL


# NOTE THIS IS USING THE STD DB FOUND IN /home1/dbs/
DB=/home1/dbs/kraken2-db-standard
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
