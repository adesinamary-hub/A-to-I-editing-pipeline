# A-to-I RNA Editing Analysis Pipeline

This repository contains a computational workflow for the detection, quantification, annotation, and differential analysis of A-to-I RNA editing events from RNA-seq datasets in both human and mouse samples. The workflow integrates conventional editing detection, hyperediting analysis, transcript quantification, statistical analysis, and visualization using Snakemake workflows and R Markdown scripts.

---

# Repository Structure

The repository is organized into directories corresponding to different stages of the workflow.

```text
├── editing/
├── hyperediting/
├── Rscript_Human/
├── Rscript_Mouse/
└── README.md
```

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

### `/hyperediting`

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

---

## Step 1 — Conventional Editing Preprocessing

Run the workflows within the `/editing` directory.

This step processes mapped RNA-seq reads to identify conventional A-to-I editing sites.


---

## Step 2 — Hyperediting Preprocessing

Run the workflows within the `/hyperediting` directory.

This step processes previously unmapped reads to recover hyperedited RNA reads that are often missed during standard alignment.


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

# Configuration Notes

Before running the pipeline:

1. Update sample names and sample groups in the R Markdown scripts.
2. Define the correct genome FASTA file path.
3. Specify REDIportal database paths.
4. Adjust replicate settings based on dataset structure.
5. Define experimental group comparisons for differential editing analysis.

---

# Output

The pipeline generates:

- filtered editing site tables
- differential editing results
- AEI values
- transcript abundance summaries
- heatmaps
- bar plots
- hyperediting summaries
- publication-ready figures

---

# Citation

If you use this workflow, please cite the relevant software tools and associated study.

---

# Contact

For questions, suggestions, or collaborations, please open an issue in this repository.
