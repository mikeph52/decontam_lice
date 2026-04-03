#!/bin/bash

#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=30GB              
#SBATCH --job-name="db_summary"
#SBATCH --output=/home1/mikeph/project_data/decontam_lice/db_summary/logs/db_summary.output
#SBATCH --mail-user=mikeph526@outlook.com 
#SBATCH --mail-type=ALL

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ncbi

echo "Kraken2 database size approximation"

echo "$(date): Arthropoda dataset aprxox. size: "
datasets summary genome taxon 6656 --as-json-lines |  python summary.py

echo "$(date): Proteobacteria dataset aprxox. size: "
datasets summary genome taxon 1224 --as-json-lines |  python summary.py

echo "$(date): Ciliophora dataset aprxox. size: "
datasets summary genome taxon 5878 --as-json-lines |  python summary.py

echo "$(date): Ascomycota dataset aprxox. size: "
datasets summary genome taxon 4890 --as-json-lines |  python summary.py

echo "$(date): Streptophyta dataset aprxox. size: "
datasets summary genome taxon 33090 --as-json-lines |  python summary.py

echo "$(date): Human dataset aprxox. size: "
datasets summary genome taxon 9606 --as-json-lines |  python summary.py

echo "$(date): Cnidaria dataset aprxox. size: "
datasets summary genome taxon 6073 --as-json-lines |  python summary.py

echo "$(date): Copepoda dataset aprxox. size: "
datasets summary genome taxon 6830 --as-json-lines |  python summary.py

echo "$(date): Chordata dataset aprxox. size: "
datasets summary genome taxon 7711 --as-json-lines |  python summary.py

echo "$(date): Fungi dataset aprxox. size: "
datasets summary genome taxon 4751 --as-json-lines |  python summary.py

echo "$(date): Job completed :-) "