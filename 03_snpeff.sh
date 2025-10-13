#!/bin/bash
#SBATCH -J hipSTR_18
#SBATCH -N 1 -n 12
#SBATCH -e /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/job-%j_%a.err
#SBATCH -o /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/job-%j_%a.log
#SBATCH -p cpcu
#SBATCH --mem=30Gb
#SBATCH -a 1-18 ### 1-18

cd /home/qianzhupigs/AllFlash/wzz_tmp/00.bin/snpEff
n=${SLURM_ARRAY_TASK_ID}

##singularity exec /home/guilu/software/087.vcftools.sif vcftools --vcf SNP${n}ok2.vcf --freq  --out ff_${n}
java -jar snpEff.jar ann sus11 ./SNP${n}ok3.vcf > SNP${n}ok2_snpeff.vcf