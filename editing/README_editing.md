# Editing detection pipeline

Quantitative analysis of A-to-I editing first takes into account edited reads that show up as A-to-G mismatches
This snakemake pipeline takes the raw reads in fastq format, aligns them and gnerates BAM files for futher analysis.

# Configuration

Before running the pipeline, update the following configuration files with the appropriate file paths and sample information.

## 1. Update configuration YAML file

Modify:

```text
config/config_240404.yaml
```

## 2. Update library parameter file

Modify:

```text
config/lib_params_240404.tsv
```

Provide the correct:

- FASTQ ID
- sample ID
- library type


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

