#!/bin/bash
#SBATCH -J Gwas
#SBATCH -N 1 -n 1
#SBATCH --mem=10Gb
#SBATCH -e /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/00.kin/gwas-%j_%a.err
#SBATCH -o /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/00.kin/gwas-%j_%a.log
#SBATCH -p cu40
#SBATCH -a 1

PBS_ARRAYID=${SLURM_ARRAY_TASK_ID}
array_jobid=${SLURM_ARRAY_JOB_ID}
jobid=${SLURM_JOB_ID}
job_name=${SLURM_JOB_NAME}
workdir=${SLURM_SUBMIT_DIR}
pid=${SLURM_TASK_PID}
cd /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/00.kin
plink2 --bfile /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/litterOK --keep ids766.txt --indiv-sort f ids766.txt --maf 0.05 --geno 0.05 --hwe 0.000001 --make-bed --out KinMerge766
#cd ../Gwas
plink --bfile KinMerge766 --pca
plink --bfile KinMerge766 --indep-pairwise 50 5 0.1 --out clean
plink --bfile KinMerge766 --extract clean.prune.in --make-bed --out litter.pruned
mv litter.pruned.fam litter.pruned.fam0
sed 's/ /\t/g' litter.pruned.fam0 | cut -f 1-5 | awk '{print $0"\t1"}' | sed 's/\t/ /g' > litter.pruned.fam
gemma -bfile litter.pruned -gk 1 -o litter.pruned
#cd /home/chenzuoquan/sun/03.Vcf/fliter
#plink --bfile chr${PBS_ARRAYID}.filted.plink3 --keep  ../PCA/keep.ind902.txt --make-bed --out  ../Gwas/chr${PBS_ARRAYID}.gwas902