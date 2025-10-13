###

for i in {1..9}; do for j in {1..9}; do /home/jxlabgdp/01.Biosoft/bin/gcta64 --reml-bivar $i $j --reml-bivar-nocove --grm test --ph
eno ppp1001.txt --reml-bivar-lrt-rg 0 --out trait_${i}_${j}; done; done