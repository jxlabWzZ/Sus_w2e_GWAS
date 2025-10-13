#!/bin/bash
#PBS -N BWA_mapping_platypus_wzz
#PBS -l nodes=1:ppn=24,mem=24gb
#PBS -e /home/wuzhongzi/qsublog
#PBS -o /home/wuzhongzi/qsublog
#PBS -q cu
#PBS -t 1 #1-159

# Kill script if any commands fail
set -e
Bwa=/opt/software/anaconda2/bin/bwa
Samtools=/opt/software/anaconda2/bin/samtools
gatk=/home/goldenpigs/software/bin/gatk
samblaster=/home/wuzhongzi/biosoft/samblaster/samblaster
ref=/home/wuzhongzi/backup_outputs/00.public_genome/10.ref/susScr11.fa
#input=/home/wuzhongzi/20.1000_pigs/00.sample
output=/home/wuzhongzi/backup_outputs/00.public_genome/11.GATK

nproc=32
#uid="Wuzz"
#ls_date=`date +m%d%H%M%S`
#temp=/tmpdisk/${uid}_${ls_date}_${PBS_ARRAYID}
#mkdir ${temp}
#cd ${temp}
cd ${output} 

line0=${PBS_ARRAYID}
line=(`sed -n "${line0}p" ${output}/aaa.txt`)


ID=`sed -n "${line0}p" ${output}/aaa.txt |awk -F"\t" '{print $1}'`
fq1=`sed -n "${line0}p" ${output}/aaa.txt |awk -F"\t" '{print $2}'`
fq2=`sed -n "${line0}p" ${output}/aaa.txt |awk -F"\t" '{print $3}'`

RG="@RG\\tID:${ID}\\tPL:ILLUMINA\\tSM:${ID}\\tLB:${ID}\\tPU:1"
#cat $fq1 > ${ID}.fastq1.fq.gz
#cat $fq2 > ${ID}.fastq2.fq.gz

#比对
#$Bwa mem -t 24 -R ${RG} ${ref} ${ID}.fastq1.fq.gz ${ID}.fastq2.fq.gz \
$Bwa mem -t 24 -R ${RG} ${ref} ${fq1} ${fq2} \
| $samblaster --excludeDups --addMateTags --maxSplitCount 2 --minNonOverlap 20 \
| $Samtools view -@ 10 -Shb - > ${ID}.raw.bam

$Samtools sort -@ 10 -o ${ID}.sorted.bam ${ID}.raw.bam
$Samtools index ${ID}.sorted.bam

rm ${ID}.raw.bam
# stat depth/coverage
export MOSDEPTH_PRECISION=5
/home/wuzhongzi/miniconda3/bin/mosdepth -n -x -t 4 stat_${ID}.txt ${ID}.sorted.bam


