#!/bin/bash

#SBATCH --partition=fat
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=30
#SBATCH --mem=480GB              
#SBATCH --job-name="kraken2"
#SBATCH --output=logs/kraken2/kraken2.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DB=/home1/mikeph/data/kraken2_db
FASTQ=/home1/mikeph/data/hifi_reads/Cal_mix.fastq.gz
FASTA=home1/mikeph/project_data/caligus_assembly/results/hifiasm/caligus_minimus.p_ctg.fasta

set -euo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "Running Kraken2 on hifiasm assembly..."

kraken2 \
  --db "$DB" \
  --threads 30 \
  --confidence 0.1\
  --output results/kraken2/hifiasm_assembly/kraken2_hifiasm.output \
  --report results/kraken2/hifiasm_assembly/kraken2_hifiasm.report \
  "$FASTA"

echo "Kraken2 run on hifiasm assembly finished."
echo "Report saved at 'results/kraken2/hifiasm_assembly/kraken2_hifiasm.report'."
echo "Job finished at $(date)."
