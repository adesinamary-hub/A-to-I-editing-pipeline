# R Markdown script for quantitative analysis of A-to-I editing in Mouse

The functions are organized in an R Markdown script (Supplementary File 8), divided into 46 chunks. 
1.	In Chunk 3, update sample_order, subset_to_plot, and subset_nice_labels to match your sample groups.
2.	Depending on the number of replicates, uncomment line 70 for triplicates or lines 73–79 for unequal replicate numbers.
Note: Sample names must follow the format “Condition_number (e.g., Wildtype_2)”. 
3.	In Chunk 10, replace fafn and rp with the correct path to your reference genome FASTA file (genome.fa) and REDIportal_rds, respectively.  
Note: Download the appropriate REDIportal database (mouse, or human), convert it to an .rds file, and save it locally. 
4.	Replace snp_bed_file in Chunk 11 with correct path to SNPs file 
Note: For mouse datasets, download dbSNP BED files for each chromosome, merge as one and convert to a BED file. 
5.	In Chunk 26, update data_dir with path to correct bed_filtered directory. 
```bash

6.	
```bash
#In Chunk 35, define sample groups:
p150_conds <- c("ADAR1p110-replica", "ADAR1p150-replica")
```

```bash
#Specify groups to compare:
conds <- list(
    c("ADAR1p110-replica", "ADAR1p150-replica"),
    c("ADAR1p150-replica", "RFP_editase_neg_ctrl"),
    c("ADAR1p110-replica", "RFP_editase_neg_ctrl")
  )
```

```bash
#Run the R Markdown script in RStudio if working locally. For large datasets, run it on a computing cluster using: 
nohup Rscript -e "rmarkdown::render('AEI_analysis_Mouse.Rmd')" > analysis.log 2>&1 &
```



