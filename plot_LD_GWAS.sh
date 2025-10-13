###QTL01
awk '{if($1==1 && $3>=31000000 && $3<=33600000 && $13 <=1/100) print $1"\t"$3"\t"$13}' output/pp3_phe1ok_lmm4.assoc.txt  > gwas-pvalue.txt
awk '{if($1==1 && $3>=31000000 && $3<=33600000 && $13 <=1/100) print $2}' output/pp3_phe1ok_lmm4.assoc.txt  > rs.txt
plink --bfile 00.kin/KinMerge_chr1 --extract rs.txt --make-bed --out qtl01
/home/qianzhupigs/AllFlash/wzz_tmp/00.bin/LDBlockShow-1.40/bin/LDBlockShow -InPlink qtl01 -OutPut qtl01 -Region 1:31000000-33600000 -InGWAS gwas-pvalue.txt -SeleVar 3 -TopSite  -OutPdf -NoShowLDist 5000000 -InGFF ../sus110_plotLD.gff3

###QTL02
awk '{if($1==13 && $3>=16100000 && $3<=18200000  && $13 <=1/100 ) print $1"\t"$3"\t"$13}' output/pp3_phe1ok_lmm4.assoc.txt  > gwas-pvalue.txt
awk '{if($1==13 && $3>=16100000 && $3<=18200000  && $13 <=1/100 ) print $2}' output/pp3_phe1ok_lmm4.assoc.txt  > rs.txt
plink --bfile 00.kin/KinMerge_chr13 --extract rs.txt --make-bed --out qtl02
/home/qianzhupigs/AllFlash/wzz_tmp/00.bin/LDBlockShow-1.40/bin/LDBlockShow -InPlink qtl02 -OutPut qtl02 -Region 13:16100000-18200000 -InGWAS gwas-pvalue.txt -SeleVar 3 -TopSite  -OutPdf -NoShowLDist 5000000 -InGFF ../sus110_plotLD.gff3

###QTL03 P14
awk '{if($1==8 && $3>=4300000 && $3<=7500000   && $13 <=1/100) print $1"\t"$3"\t"$13}' output/pp3_phe1ok_lmm4.assoc.txt  > gwas-pvalue.txt
awk '{if($1==8 && $3>=4300000 && $3<=7500000   && $13 <=1/100) print $2}' output/pp3_phe1ok_lmm4.assoc.txt  > rs.txt
plink --bfile 00.kin/KinMerge_chr8 --extract rs.txt --make-bed --out qtl03
/home/qianzhupigs/AllFlash/wzz_tmp/00.bin/LDBlockShow-1.40/bin/LDBlockShow -InPlink qtl03 -OutPut qtl03 -Region 8:4300000-7500000 -InGWAS gwas-pvalue.txt -SeleVar 3 -TopSite  -OutPdf -NoShowLDist 5000000 -InGFF ../sus110_plotLD.gff3

###QTL04 P14b
awk '{if($1==13 && $3>=197000000 && $3<=199100000   && $13 <=1/100 ) print $1"\t"$3"\t"$13}' output/pp3_phe2ok_lmm4.assoc.txt  > gwas-pvalue.txt2
awk '{if($1==13 && $3>=197000000 && $3<=199100000   && $13 <=1/100 ) print $2}' output/pp3_phe2ok_lmm4.assoc.txt  > rs.txt2
plink --bfile 00.kin/KinMerge_chr13 --extract rs.txt2 --make-bed --out qtl04
/home/qianzhupigs/AllFlash/wzz_tmp/00.bin/LDBlockShow-1.40/bin/LDBlockShow -InPlink qtl04 -OutPut qtl04 -Region 13:197000000-199100000 -InGWAS gwas-pvalue.txt2 -SeleVar 3 -TopSite  -OutPdf -NoShowLDist 5000000 -InGFF ../sus110_plotLD.gff3

###QTL05 P14b
awk '{if($1==16 && $3>=12000000 && $3<=14100000  && $13 <=1/100) print $1"\t"$3"\t"$13}' output/pp3_phe2ok_lmm4.assoc.txt  > gwas-pvalue.txt3
awk '{if($1==16 && $3>=12000000 && $3<=14100000  && $13 <=1/100) print $2}' output/pp3_phe2ok_lmm4.assoc.txt  > rs.txt3
plink --bfile 00.kin/KinMerge_chr16 --extract rs.txt3 --make-bed --out qtl05
/home/qianzhupigs/AllFlash/wzz_tmp/00.bin/LDBlockShow-1.40/bin/LDBlockShow -InPlink qtl05 -OutPut qtl05 -Region 16:12000000-14100000 -InGWAS gwas-pvalue.txt3 -SeleVar 3 -TopSite  -OutPdf -NoShowLDist 5000000 -InGFF ../sus110_plotLD.gff3

###QTL06
awk '{if($1==8 && $3>=8800000 && $3<=10900000  && $13 <=1/100) print $1"\t"$3"\t"$13}' output/pp3_phe2ok_lmm4.assoc.txt  > gwas-pvalue.txt
awk '{if($1==8 && $3>=8800000 && $3<=10900000  && $13 <=1/100) print $2}' output/pp3_phe2ok_lmm4.assoc.txt  > rs.txt
plink --bfile 00.kin/KinMerge_chr8 --extract rs.txt --make-bed --out qtl06
/home/qianzhupigs/AllFlash/wzz_tmp/00.bin/LDBlockShow-1.40/bin/LDBlockShow -InPlink qtl06 -OutPut qtl06 -Region 8:8800000-10900000 -InGWAS gwas-pvalue.txt -SeleVar 3 -TopSite  -OutPdf -NoShowLDist 5000000 -InGFF ../sus110_plotLD.gff3


