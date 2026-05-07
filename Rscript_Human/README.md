# Quantitative analysis of A-to-I editing in Human using raer

#The BAM files generated from editing and hyperedititng are further anaylzed to quantify A-to-I ediitng represented as A to G mismatches and generate visuals for publication.
 
The Rmd script is divided into 46 chunks, edit accordingly on Rstudio 
```bash
#Run on an hp cluster and generate readable log file
nohup Rscript -e "rmarkdown::render('AEI_analysis_Mouse.Rmd')" > analysis.log 2>&1 &
```
In Chunk 3, update sample_order, subset_to_plot, and subset_nice_labels to match your sample groups.
```bash
sample_order <- c("ADAR1p110-replica",
                  "ADAR1p150-replica",
                  "RFP_editase_neg_ctrl"
                  )

subset_to_plot <- c("ADAR1p110-replica",
                  "ADAR1p150-replica",
                  "RFP_editase_neg_ctrl"
                  )

subset_nice_labels <- c("ADAR1p110-replica",
                  "ADAR1p150-replica",
                  "RFP_editase_neg_ctrl"
                  )
```

Depending on the number of replicates, uncomment line 70 for triplicates or lines 73–79 for unequal replicate numbers.
```bash
#For equal number of sample replicates ( e.g three samples per group)
samples <- paste0(rep(sample_order, each = 3), "_", c("1", "2", "3"))

#For unequal number of sample replicates (e.g 3 p110_replica, 3 p150_replica, 2 neg_cntrl)
rep_counts <- c(3, 3, 1)
samples <- unlist(
  mapply(function(s, n) paste0(s, "_", seq_len(n)),
         sample_order,
         rep_counts,
         SIMPLIFY = FALSE)
) 
```

Download mouse REDIportal database (http://rediportal.cloud.ba.infn.it/download/TABLE1_mm10_v3.txt.gz), convert it to an .rds file, and save it locally.
```bash
#In Chunk 10, replace fafn and rp with the correct path to your reference genome FASTA file (genome.fa) and REDIportal_rds, respectively.  
fafn <- "/genome.fa"

rp <- readRDS("/rediportalll__mm39_rse.rds")
```
Download dbSNP BED files for each chromosome https://ftp.ncbi.nlm.nih.gov/snp/organisms/archive/mouse_10090/BED/, merge as one and convert to a BED file.
```bash
#Replace snp_bed_file in Chunk 11 with correct path to SNPs file 
snp_bed_file <- "/mouse_snps_merged.sorted.bed"
```

In Chunk 26, update data_dir with path to correct bed_filtered directory. 
```bash
data_dir <- ("/2024-04-04/hyperediting/bed_filtered/")
```

In Chunk 35, define sample groups
```bash
p150_conds <- c("ADAR1p110-replica", "ADAR1p150-replica")

p110_he_sites <- he_sites[he_sites$condition == "ADAR1p110-replica" ]
p150_he_sites <- he_sites[he_sites$condition == "ADAR1p150-replica" ]
```
In Chunk 39 Specify groups to compare
```bash
conds <- list(
    c("ADAR1p110-replica", "ADAR1p150-replica"),
    c("ADAR1p150-replica", "RFP_editase_neg_ctrl"),
    c("ADAR1p110-replica", "RFP_editase_neg_ctrl")
  )
```
In Chunk 42, difine sample groups
```bash
p150_sites <- de_res_all$`ADAR1p110-replica_vs_ADAR1p150-replica`$sig_results |>
```




