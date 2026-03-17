#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=40000
#SBATCH --job-name="quast_lice"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/qc/quast.output
#SBATCH --mail-user=mikeph526@outlook.com
#SBATCH --mail-type=ALL

quast /home1/mikeph/data/hifi_reads/cal_hifi_reads.fasta \
  --output-dir results/quast/ \
  --min-contig 500 \
  --threads 20
