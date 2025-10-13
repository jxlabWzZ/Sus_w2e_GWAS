par(mfrow=c(2,1))
a<-read.table("/Users/wuzhongzi/Desktop/pp1.txt",header=F)
plot(a$V2/1000000,a$V5,type="l",ylim=c(0,1),col="darkblue",lwd=2,xlab="Chromosome 1",ylab="Fst (EWB vs WEI345)")
abline(h=0.493989,col="red")
b<-read.table("/Users/wuzhongzi/Desktop/pi_1.txt",header=F)
plot(b$V3/1000000,b$V1,type="l",ylim=c(0,3),col="darkgreen",lwd=2,xlab="Chromosome 1",ylab="Pi ratio (EWB / WEI345)")
abline(h=2,col="red")

