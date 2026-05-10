 #!/usr/bin/env bash
#BSUB -J RNA-edits
#BSUB -o logs/snakemake_%J.out
#BSUB -e logs/snakemake_%J.err
#BSUB -R "select[mem>4] rusage[mem=4] "
mkdir -p logs

set -o nounset -o pipefail -o errexit -x

args='
      -q rna 
      -o {log}.out
      -e {log}.err
      -J {params.job_name}
      -R " {params.memory} span[hosts=1] "
      -n {threads} '

module load salmon STAR python/3.8.5 samtools 

snakemake \
    --drmaa "$args" \
    --snakefile workflow/Snakefile \
    --jobs 12 \
    --latency-wait 50 \
    --rerun-incomplete \
    --printshellcmds \
    --configfile config/config_240404.yaml
    #--use-singularity \
