#!/bin/bash
#SBATCH -J 1h-Gwas
#SBATCH -N 1 -c 10
#SBATCH --mem=20Gb
#SBATCH -e /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/01.hert01/gwas-%j_%a.err
#SBATCH -o /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/01.hert01/gwas-%j_%a.log
#SBATCH -p all
#SBATCH -a 1

cd /home/qianzhupigs/AllFlash/wzz_tmp/22.XWS/12.samples1277/01.PP1/11.w2e/P8/01.hert01/

/home/jxlabgdp/01.Biosoft/bin/gcta64 --bfile ../00.kin/KinMerge766 --make-grm --out test
/home/jxlabgdp/01.Biosoft/bin/gcta64 --reml --grm test --pheno p.txt --covar cc.txt --qcovar qq.txt --out test