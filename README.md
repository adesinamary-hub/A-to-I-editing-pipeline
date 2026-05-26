# A-to-I Editing Landscape Analysis Pipeline (AEDITscape)

This repository contains a computational workflow for the detection, quantification, annotation, and differential analysis of A-to-I RNA editing events from RNA-seq datasets in both human and mouse samples. The workflow integrates conventional editing detection, hyperediting analysis, transcript quantification, statistical analysis, and visualization using Snakemake workflows and R Markdown scripts.

---

## Directory Description

### `/editing`

Contains scripts and workflows for preprocessing and detection of conventional A-to-I RNA editing events from mapped RNA-seq reads.

This stage includes:

- adapter trimming
- quality filtering
- genome alignment
- BAM processing
- SNP filtering
- editing site detection

---

# `/hyperediting`

Contains scripts and workflows for hyperediting detection using previously unmapped reads.

Because hyperedited reads often fail standard genome alignment, unmapped reads are separately processed to recover highly edited RNA molecules.

This stage includes:

- extraction of unmapped reads
- hyperediting alignment
- hyperedited site detection
- filtering and processing of hyperedited BAM files

---

### `/Rscript_Human`

Contains R Markdown scripts for downstream analysis of human RNA editing datasets.

Analyses include:

- Alu Editing Index (AEI) calculation
- differential editing analysis 
- visualization and figure generation

---

### `/Rscript_Mouse`

Contains equivalent R Markdown workflows for mouse datasets.

Mouse-specific analyses include editing quantification within repetitive SINE elements (B1, B2, B4, ID)

---

# Workflow Overview

The pipeline should be run in the following order:
Download all folders into your working environment.

## Step 1 

Run the workflows within the `/editing` directory.
1. Update config/config_240404.yaml file
2. Update config/lib_params_240404.tsv with correct FASTQ ID, sample ID, library type
3. Ensure snakemake is installed
```bash
snakemake --help   
```
4. Modify snakecharmer.sh script depending on your cluster/local setup
5. Return to /editing directory
```bash
cd  ..
```
7. Test run to confirm that all file paths are accurate. This would simply run, without executing
```bash
snakemake -n -p
```
![Project Logo](images/snakemake_prerun_editing "output")   

6. Run 
```bash
snakemake -p 
```

## Step 2

Run the workflows within the `/hyperediting` directory.

1. Update config/config_20240415.yaml file
2. Install Required dependencies
   The required dependencies are specified in environment2.yaml, and can be installed as a conda environment
which will be named `hyperediting3`. Alternatively, the required dependencies
can be installed manually and should work as long as they are found in 
the PATH.

```bash
conda env create -f environment2.yaml
```

```bash
conda activate hyperediting3
```
Test the snakemake pipeline
```bash
snakemake -n -p 
```

Modify #relevant command in snakecharmer.sh script depending on your cluster/local setup
and run the pipeline

```bash
# on a lsf cluster
bsub < snakecharmer.sh

# on a local run
bash snakecharmer.sh
```


## Step 3 — Downstream Analysis in R

1. Update condition name and file paths in script
2. Run the R Markdown workflows in:

- `/Rscript_Human` for human datasets
- `/Rscript_Mouse` for mouse datasets

```bash
#Run on R studio or local run
nohup Rscript -e "rmarkdown::render('AEI_analysis_Mouse.Rmd')" > analysis.log 2>&1 &
```
---



###   File naming
condition /sample group name should follow this order; condition, "_", number (0-10) 

e.g - `Wildtype_1`, `KO_1`, `Negative_ctrl_1`



## Software Requirements

#### Core Software

- R (≥ 4.4)
- Python (≥ 3.12.0)
- snakemake (≥ 9.5.1)
- cutadapt (≥ 1.8.3)
- STAR (≥ 2.7.11)
- salmon (≥ 1.10.1)
- samtools (≥ 1.21)
- bwa (≥ 0.7.19)
- fastp (≥ 1.0.1)
---
