#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=40000              
#SBATCH --job-name="kraken2"
#SBATCH --output=logs/shell/kraken2.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

snakemake --cores 20
