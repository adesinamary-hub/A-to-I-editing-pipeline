# A-to-I RNA Editing Analysis Pipeline

This repository contains a computational pipeline for the detection, quantification, differential analysis, and visualization of A-to-I RNA editing events from RNA-seq datasets in human and mouse samples. The workflow integrates preprocessing, alignment, editing detection, hyperediting analysis, transcript quantification, statistical analysis, and visualization using reproducible scripts written in Snakemake and R Markdown.

Overview

##  The pipeline performs:
1. RNA-seq quality control and adapter trimming
2. Genome alignment and BAM processing
3. Detection of edited and hyperedited A-to-I sites
4. SNP filtering
5. Annotation of editing sites
6. Alu Editing Index (AEI) calculation
7. Differential editing analysis
8. Visualization of editing patterns and statistical analysis in R

The workflow supports both human and mouse datasets.

## Repository Structure

├── workflow/                 # Snakemake workflow files
├── scripts/                  # Custom Python and R scripts
├── config/                   # Configuration files
├── notebooks/                # R Markdown analysis files
├── plots/                    # Output figures
├── results/                  # Processed results
└── README.md


## Requirements

- R (>= 4.0)
- Python (>= 3.0)
- Snakemake
- fastp
- STAR
- samtools
- Salmon
- BWA
- Bioconductor packages


## Input Files

The pipeline accepts paired-end RNA-seq FASTQ files:

sample_1.fastq.gz
sample_2.fastq.gz

Additional required files:

- Reference genome FASTA
- Genome annotation GTF
- REDIportal annotation database
- dbSNP BED files
  
Update necessary paths and directories in editing and hyperediting configuration files 
```bash
#Ensure all files and folder exist in your working directory;
~/Pipeline
```
