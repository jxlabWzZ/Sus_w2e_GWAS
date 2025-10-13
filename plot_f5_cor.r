###f1d
# 加载所需的包
library(ggplot2)
# 创建数据框，包含细胞类型和共享组织数目
data <- read.table("/Users/wuzhongzi/Desktop/ok5p8.txt",header=F)
# 设置因子顺序
data$Name = factor(data$V2,
                   levels = c("7", "2", "6", "1","8", "9", "10", "11", "12", "14", "17", "13", "18", "19", "20", "21","22"))
# 设置颜色
#Color = c("grey", "darkorange", "brown", "green", "blue", "orange", "yellow", "purple", "red")
# 创建棒棒糖图
ggplot(data, aes(x = V3, y = Name)) +
  # 添加点
  geom_point(aes(color = Name), size = 3.5) +
  # 添加点的外圈
  geom_point(aes(color = Name), size = 5, shape = 21, fill = NA) +
  # 添加线条
  geom_segment(aes(x = V3-V4, xend = V3+V4, y = Name, yend = Name, color = Name), linewidth = 1) +
  # 设定颜色
#  scale_color_manual(values = Color) +
  # 设置主题
  theme_classic() +
  theme(legend.position = "none",  # 移除图例
        panel.border = element_rect(color = "black", fill = NA, linewidth = 1), # 添加边框
        axis.line = element_line(color = "black"), # 添加轴线
        panel.grid.major = element_line(color = "grey", linewidth = 0.5), # 添加主网格线
        panel.grid.minor = element_line(color = "grey", linewidth = 0.25)) + # 添加次网格线
  # 设置x轴范围
  xlim(-0.7, 1) +
  # 设置坐标轴标签
  labs(x = "Genetic correlation", y = "") #+
  # 在点旁边添加数值标签
  #geom_text(aes(label = V5), hjust = -1)
# 保存图像
#ggsave("lollipop_chart.pdf", width = 6, height = 6)

###
###f1d
# 加载所需的包
library(ggplot2)
# 创建数据框，包含细胞类型和共享组织数目
data <- read.table("/Users/wuzhongzi/Desktop/ok5p14.txt",header=F)
# 设置因子顺序
data$Name = factor(data$V2,
                   levels = c("7", "2", "6", "1","8", "9", "10", "11", "12", "14", "17", "13", "18", "19", "20", "21","22"))
# 设置颜色
#Color = c("grey", "darkorange", "brown", "green", "blue", "orange", "yellow", "purple", "red")
# 创建棒棒糖图
ggplot(data, aes(x = V3, y = Name)) +
  # 添加点
  geom_point(aes(color = Name), size = 3.5) +
  # 添加点的外圈
  geom_point(aes(color = Name), size = 5, shape = 21, fill = NA) +
  # 添加线条
  geom_segment(aes(x = V3-V4, xend = V3+V4, y = Name, yend = Name, color = Name), linewidth = 1) +
  # 设定颜色
#  scale_color_manual(values = Color) +
  # 设置主题
  theme_classic() +
  theme(legend.position = "none",  # 移除图例
        panel.border = element_rect(color = "black", fill = NA, linewidth = 1), # 添加边框
        axis.line = element_line(color = "black"), # 添加轴线
        panel.grid.major = element_line(color = "grey", linewidth = 0.5), # 添加主网格线
        panel.grid.minor = element_line(color = "grey", linewidth = 0.25)) + # 添加次网格线
  # 设置x轴范围
  xlim(-0.7, 1) +
  # 设置坐标轴标签
  labs(x = "Genetic correlation", y = "") 