# Editing detection pipeline

Quantitative analysis of A-to-I editing first takes into account edited reads that show up as A-to-G mismatches
This snakemake pipeline will take the raw reads in fastq format, align them and gnerate edited reads in BAM files for futher analysis.


Update config.yaml file with your own file paths, adapter sequences, and output directories 

Update LIB_param.tsv file with appropriate Fastq ID, sample ID, and library type.

Ensure snakemake is installed
```bash
snakemake --help   
```

Modify the snakecharmer.sh script depending on your cluster/local setup

Test run to confirm that all file paths are accurate. This would simply run, without executing
```bash
snakemake -n -p
```
Run the pipeline 
```bash
snakemake -p 
```

