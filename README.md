# A-to-I RNA Editing Analysis Pipeline

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


## Step 1 

Run the workflows within the `/editing` directory.
1. Update config/config_240404.yaml file
2. Update config/lib_params_240404.tsv with correct FASTQ ID, sample ID, library type
3. Ensure snakemake is installed
```bash
snakemake --help   
```
4. Modify snakecharmer.sh script depending on your cluster/local setup
5. Test run to confirm that all file paths are accurate. This would simply run, without executing
```bash
snakemake -n -p
```
6. Run the pipeline 
```bash
snakemake -p 
```


## Step 2

Run the workflows within the `/hyperediting` directory.
1. 

---

## Step 3 — Downstream Analysis in R

Run the R Markdown workflows in:

- `/Rscript_Human` for human datasets
- `/Rscript_Mouse` for mouse datasets

---








# Software Requirements

## Core Software

- R (≥ 4.1)
- Python (> 3.0)
- Snakemake
- STAR
- Salmon
- samtools
- bwa
- fastp
---

# Contact

For questions, suggestions, or collaborations, please open an issue in this repository.
