#f1a
# 数据准备
info = c(40,30,30)
# 命名
names = c("PPP", "WWW", "W2E")
par(mai=c(1,1,1,1)) par(mar=c(2, 2, 2, 2))
# 涂色（可选）
cols = c("#22B14C","#3f48CC","#3f90CC")
# 计算百分比
piepercent = paste(round(100*info/sum(info),2), "%")
# 绘图
pdf("/Users/wuzhongzi/Desktop/gene2.pdf")
pie(info, labels=piepercent,col=cols,border="white",cex=2)
# 添加颜色样本标注
legend("top", names, cex=2, fill=cols)
dev.off()

###f1b
library(ggplot2)
a<-read.table("/Users/wuzhongzi/Desktop/p30_w2e_922.txt",header=F)
barplot(a$V2,names=a$V1,col="darkgreen")

### f1c
library(ggplot2)
a<-read.table("/Users/wuzhongzi/Desktop/stat_1238.txt",header=F)

par(mfrow=c(1,1))
plot(hist(a$V2,breaks=30),xlim=c(0,25))
plot(hist(a$V3,breaks=50),xlim=c(0.95,0.98))

####
####
#install.packages("ggpointdensity")
library(ggpointdensity)
library(viridis)
library(ggplot2)
library(cowplot)  #用于图例截取，以及多图组合
mydata<-read.table("/Users/wuzhongzi/Desktop/stat_1238.txt",header=F)
#密度散点图
p1 <- ggplot(mydata, aes(V2, V3)) +
  theme(panel.grid.major = element_blank(), panel.background = element_rect(color = 'gray30', fill = 'transparent')) +
  geom_pointdensity(cex=0.5) +
  scale_color_viridis() +xlim(0,25)+ylim(0.95,0.98)+
scale_color_gradientn(colors = c('darkgreen'))

#获取上述图例
p1_legend <- get_legend(p1)

#X 轴数据的频数分布直方图
p2 <- ggplot(mydata, aes(V2)) +
  theme(panel.grid.major = element_blank(), panel.background = element_rect(color = 'gray30', fill = 'transparent')) +
  geom_histogram(binwidth = (max(mydata$V2) - min(mydata$V2))/50,col="grey30",fill="grey") +
  labs(x = '')+xlim(0,25)

#Y 轴数据的密度曲线图
p3 <- ggplot(mydata, aes(V3)) +
  theme(panel.grid.major = element_blank(), panel.background = element_rect(color = 'gray30', fill = 'transparent')) +
  #geom_line(stat = 'density') +
  geom_histogram(binwidth = (max(mydata$V3) - min(mydata$V3))/50,col="grey30",fill="grey") +
  coord_flip() +
  labs(x = '')+xlim(0.95,0.98)

#组合
ggdraw(plot_grid( plot_grid(p2, p1+theme(legend.position = 'none'), ncol = 1, rel_heights = c(1, 2)),
                  plot_grid(p1_legend, p3, ncol = 1, rel_heights = c(1, 2)), rel_widths = c(2, 1)))




###f1d
# 加载所需的包
library(ggplot2)
# 创建数据框，包含细胞类型和共享组织数目
data <- read.table("/Users/wuzhongzi/Desktop/hert.txt",header=T)
# 设置因子顺序
data$Name = factor(data$Name,
                   levels = c("P8", "P14", "P14b", "P21", "P21b", "P30", "P30b"))
# 设置颜色
Color = c("grey", "darkorange", "brown", "green", "blue", "orange", "yellow", "purple", "red")
# 创建棒棒糖图
ggplot(data, aes(x = Value, y = Name)) +
  # 添加点
  geom_point(aes(color = Name), size = 3.5) +
  # 添加点的外圈
  geom_point(aes(color = Name), size = 5, shape = 21, fill = NA) +
  # 添加线条
  geom_segment(aes(x = Value-se, xend = Value+se, y = Name, yend = Name, color = Name), linewidth = 1) +
  # 设定颜色
  scale_color_manual(values = Color) +
  # 设置主题
  theme_classic() +
  theme(legend.position = "none",  # 移除图例
        panel.border = element_rect(color = "black", fill = NA, linewidth = 1), # 添加边框
        axis.line = element_line(color = "black"), # 添加轴线
        panel.grid.major = element_line(color = "grey", linewidth = 0.5), # 添加主网格线
        panel.grid.minor = element_line(color = "grey", linewidth = 0.25)) + # 添加次网格线
  # 设置x轴范围
  xlim(0, 0.5) +
  # 设置坐标轴标签
  labs(x = "Heritity", y = "") +
  # 在点旁边添加数值标签
  geom_text(aes(label = Value), hjust = -2)
# 保存图像
#ggsave("lollipop_chart.pdf", width = 6, height = 6)
