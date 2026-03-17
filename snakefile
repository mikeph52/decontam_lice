rule kraken:
    input:
	#fix the input before executing
        "/home1/mikeph/data/hifi_reads/cal_hifi_reads.fasta",
        "/home1/mikeph/data/A.fastq"
    output:
        "results/kraken2/A.bam"
    shell:
	"./kraken2-build --standard --threads 24 --db database/"
        "kraken2 --db  "

