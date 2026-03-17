# Sea louse decontamination workflow

## File structure

```bash
.
|-- logs
|   |-- busco
|   |-- qc
|   |   `-- quast.output
|   `-- shell
|-- results
|   `-- quast
|       |-- quast_corrected_input
|       |   `-- cal_hifi_reads.fasta
|       `-- quast.log
|-- scripts
|   |-- busco.sh
|   `-- quast.sh
|-- snakefile
`-- workflow.sh
```

## Depedencies

### For workflow management:
- Snakemake
- SLURM

### For QC:
- BUSCO
- QUAST

### For decontamination:
- Kraken 2

## More updates in the future
