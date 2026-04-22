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
POL_RESULTS=/home1/mikeph/project_data/decontam_lice/results/kraken2/polished1
RESULTS=/home1/mikeph/project_data/decontam_lice/results

set -euo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "Decontamination workflow of Caligus minimus."
echo "$(date): Running kraken2. . ."

kraken2 \
  --db "$DB" \
  --threads 20 \
  --confidence 0.1\
  --output "$POL_RESULTS"/dec.kraken2_4.output \
  --report "$POL_RESULTS"/dec.kraken2_4.report \
  "$FASTA"

echo "$(date): Kraken2 completed."
echo "$(date): Extraction of unclassified contig IDs started."

awk '$1 == "U" {print $2}' "$POL_RESULTS"/dec.kraken2_4.output > "$RESULTS"/awk/unclassified_contigs.txt

echo "$(date): Extraction of unclassified contig IDs finished. Saved at ${$RESULTS}/awk/unclassified_contigs.txt "
echo "$(date): Removal of contaminants with seqtk started."

seqtk subseq "$FASTA" "$RESULTS"/awk/unclassified_contigs.txt > "$RESULTS"/seqtk/polished_1_decontam.fasta

echo "$(date): Removal of contaminants with seqtk completed."
echo "$(date): Decontamination verification started."
echo "$(date): Running biogenie. . ."

biogenie -sh "$FASTA"
echo "------------------------------------------------------------------------------------------------------"
biogenie -sh "$RESULTS"/seqtk/polished_1_decontam.fasta

echo "$(date): Biogenie completed."
echo "$(date): Running kraken2. . ."

kraken2 \
  --db "$DB" \
  --threads 20 \
  --confidence 0.1\
  --output "$POL_RESULTS"/decontaminated_kraken2.output \
  --report "$POL_RESULTS"/decontaminated_kraken2.report \
  "$RESULTS"/seqtk/polished_1_decontam.fasta

  echo "$(date): Decontamination verification finished."
  echo "$(date): Job finished."