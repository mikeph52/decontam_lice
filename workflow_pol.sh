#!/bin/bash
# THIS IS A VERSION OF THE WORKFLOW SCRIPT, RUNNING WITH THE POLISHED DATA FROM THE FIRST ITERRATION OF FLYE
# USED SOLELY FOR TESTING PURPOSES

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=200GB              
#SBATCH --job-name="kraken2"
#SBATCH --output=logs/kraken2/kraken2_pol.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db
FASTA=/home1/mikeph/project_data/caligus_assembly/results/flye/40-polishing/polished_1.fasta
FASTQ=/home1/mikeph/data/hifi_reads/Cal_mix.fastq.gz
POL_RESULTS=/home1/mikeph/project_data/decontam_lice/results/kraken2/polished1

set -euo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

kraken2 \
  --db "$DB" \
  --threads 20 \
  --confidence 0.1\
  --output "$POL_RESULTS"/dec.kraken2_4.output \
  --report "$POL_RESULTS"/dec.kraken2_4.report \
  "$FASTA"
