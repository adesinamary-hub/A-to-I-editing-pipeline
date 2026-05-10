# Editing detection pipeline

Before running the pipeline, update the following configuration files with the appropriate file paths and sample information.

#### Update configuration YAML file

Modify:

```text
config/config_240404.yaml
```

#### Update library parameter file with correct FASTQ ID, sample ID, library type

Modify:

```text
config/lib_params_240404.tsv
```

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

