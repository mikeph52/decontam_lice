# Scripts for genome decontamination of _Caligus minimus_ explained
_Last edited at: Tuesday, 21/4/2026, 10:10. Relevant to version:_

## Scripts folder:
```bash
.
|-- bamtofastq.sh
|-- database_old.sh
|-- database.sh
|-- database_single.sh
|-- kraken2-db_std.sh
|-- estimate_db_size.sh
`-- scripts.md
```

## The scripts
### Main scripts

- ### `bamtofastq.sh`
    BAM to FASTQ file conversion using Samtools v.1.23

- ### `estimate_db_size.sh`
    Calculates the estimate size of the database from existing size records from NCBI ,if are any. Pretty self-explanatory.

- ### `database.sh`
    This script is downloading the dehydrated datasets, extracting them, rehydrating the data, and building the Kraken2 database from scratch. The total allocated RAM size of the script is dependent on the total database size, because kraken2 needs to load the downloaded datasets directly into the RAM all at once before the database construction starts.

### Testing scripts

- ### `database_old.sh`
    The previous version of `database.sh`, kept for documentation purposes.

- ### `kraken2-db_std.sh`
    Version of the main `workflow.sh` but running with the _default_ kraken database located at `/home1/dbs/kraken2-db-standard`, for testing purposes.

- ### `database_single.sh`
    Version of the `database.sh` but downloads only the _Ciliophora_ dataset, for testing purposes.