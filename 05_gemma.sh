#!/bin/bash
#SBATCH -J 1h-Gwas
#SBATCH -N 1 -c 10
#SBATCH --mem=20Gb
#SBATCH -e /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/gwas-%j_%a.err
#SBATCH -o /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/gwas-%j_%a.log
#SBATCH -p all
#SBATCH -a 1-2

PBS_ARRAYID=${SLURM_ARRAY_TASK_ID}
array_jobid=${SLURM_ARRAY_JOB_ID}
jobid=${SLURM_JOB_ID}
job_name=${SLURM_JOB_NAME}
workdir=${SLURM_SUBMIT_DIR}
pid=${SLURM_TASK_PID}

input=/home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8

cd $input
gemma -bfile /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/00.kin/KinMerge766 -p ./p.txt -n ${PBS_ARRAYID} -k /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/00.kin/output/litter.pruned.cXX.txt -c cov2.txt -l mm 4 -o cov2_phe${PBS_ARRAYID}_lmm4