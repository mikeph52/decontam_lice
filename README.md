# Sea louse decontamination workflow

## File structure

```bash
.
|-- logs
|   |-- busco
|   |   `-- busco_lice.output
|   |-- kraken2
|   |   |-- download_arthropoda.output
|   |   `-- p7zip_db.output
|   |-- qc
|   |   `-- quast.output
|   `-- samtools
|       `-- bamtofastq.output
|-- README.md
|-- results
|   `-- quast
|       |-- basic_stats
|       |   |-- cal_hifi_reads_GC_content_plot.pdf
|       |   |-- cumulative_plot.pdf
|       |   |-- GC_content_plot.pdf
|       |   `-- Nx_plot.pdf
|       |-- icarus.html
|       |-- icarus_viewers
|       |   `-- contig_size_viewer.html
|       |-- quast.log
|       |-- report.html
|       |-- report.pdf
|       |-- report.tex
|       |-- report.tsv
|       |-- report.txt
|       |-- transposed_report.tex
|       |-- transposed_report.tsv
|       `-- transposed_report.txt
|-- scripts
|   |-- bamtofastq.sh
|   |-- busco.sh
|   |-- database.sh
|   |-- datasets_missing.sh
|   |-- decontamination.sh
|   |-- p7zip_db.sh
|   `-- quast.sh
`-- workflow.sh

```

## Depedencies

### For utilities:
- p7zip
- ncbi
- samtools

### For workflow management:
- Snakemake
- SLURM

### For QC:
- BUSCO
- QUAST

### For decontamination:
- Kraken 2

## More updates in the future
