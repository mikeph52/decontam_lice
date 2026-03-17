#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=40000              
#SBATCH --job-name="busco_lice"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/logs/busco/busco_lice.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

DATA=/home1/mikeph/data/hifi_reads/cal_hifi_reads.fasta
RESULTS=/home1/mikeph/project_data/decontam_lice/results

echo $SLURM_JOB_NAME
echo $SLURM_JOB_PARTITION
echo $SLURMD_NODENAME
echo $SLURM_JOB_ID
echo $SLURM_JOB_CPUS_PER_NODE

echo "Job Start: `date`"

busco -i "$DATA" -m genome -o "$RESULTS" -l arthropoda_odb12 -c 20

echo "Job End: `date`"
