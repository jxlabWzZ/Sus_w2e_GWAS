#!/bin/bash
#PBS -N BWA_mapping_wzz_v2
#PBS -l nodes=1:ppn=10,mem=10gb
#PBS -e /home/wuzhongzi/qsublog
#PBS -o /home/wuzhongzi/qsublog
#PBS -q cu
#PBS -t 1-231 #1-159

# Kill script if any commands fail
set -e
Bwa=/opt/software/anaconda2/bin/bwa
Samtools=/opt/software/anaconda2/bin/samtools
gatk=/home/goldenpigs/software/bin/gatk
ref=/home/wuzhongzi/backup_outputs/00.public_genome/10.ref/susScr11.fa
#input=/home/wuzhongzi/20.1000_pigs/00.sample
output=/home/wuzhongzi/backup_outputs/00.public_genome/11.GATK

nproc=12
#uid="Wuzz"
#ls_date=`date +m%d%H%M%S`
#temp=/tmpdisk/${uid}_${ls_date}_${PBS_ARRAYID}
#mkdir ${temp}
#cd ${temp}
cd ${output} 

line0=${PBS_ARRAYID}
line=(`sed -n "${line0}p" ${output}/ids231.txt`)


ID=`sed -n "${line0}p" ${output}/ids231.txt |awk -F"\t" '{print $1}'`
#fq1=`sed -n "${line0}p" ${output}/ids01.txt |awk -F"\t" '{print $2}'`
#fq2=`sed -n "${line0}p" ${output}/ids01.txt |awk -F"\t" '{print $3}'`


#生成gvcf文件
for chr in `seq 1 18` X Y;do

 time ${gatk} HaplotypeCaller \
 --native-pair-hmm-threads 12 \
 -R ${ref} \
 -I /home/wuzhongzi/backup_outputs/00.public_genome/11.GATK/10.add231ok/${ID}.sorted.bam \
 -ERC GVCF \
 -L chr${chr} \
 -O /home/wuzhongzi/backup_outputs/00.public_genome/11.GATK/11.gvcf_ok231/${ID}_chr${chr}.g.vcf.gz


done
# tabix -p vcf ${ID}_chrY.g.vcf.gz
#for CHR in `seq 1 18` X Y;do
#$GATK --java-options "-Xmx60G" HaplotypeCaller \
#-R $REF -I ${INP}/${SAMP} -O ${OUTPUT}/${NAME}_chr${CHR}_g.vcf.gz  -ERC GVCF -L chr${CHR}
#done
