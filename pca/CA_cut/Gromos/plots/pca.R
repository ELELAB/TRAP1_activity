############################################
library(ggplot2)
library(viridis)
library(reshape2)
library(tidyverse)
library(plyr)
################################################################################################################
################################################################################################################
pca = read.table("/Users/Matteo/Dropbox (ELELAB)/TRAP1_activity/data/PCA_CA_all/monomer/Amber/proj2d_1vs2_mt.xvg", header = FALSE, fill = TRUE)
#rmsfx <- rmsf[c(1,2,4,6,8,10,12,14,16)]
pcax <- rename(pca, c("V1"="time", "V2"="PC1", "V3"="PC2"))
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  scale_fill_viridis_c() +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
#  theme(panel.background = element_rect(fill = "white", colour = "grey50"))
ggsave("2dplotPC1vPC2.monomer.Amb.pdf",p, width=10, height=8, units="in")
#########################################
pca.SH.A.AM <- pcax[c(0:1501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.A.AM, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-141,112) +
  xlim(-197,165)
ggsave("2dplotPC1vPC2.monomer.SH.A.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SH.B.AM <- pcax[c(1502:3001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.B.AM, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-141,112) +
  xlim(-197,165)
ggsave("2dplotPC1vPC2.monomer.SH.B.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.A.AM <- pcax[c(3002:4501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.A.AM, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-141,112) +
  xlim(-197,165)
ggsave("2dplotPC1vPC2.monomer.SNO.A.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.B.AM <- pcax[c(4502:6001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.B.AM, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-141,112) +
  xlim(-197,165)
ggsave("2dplotPC1vPC2.monomer.SNO.B.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
################################################################################################################
pca = read.table("/Users/Matteo/Dropbox (ELELAB)/TRAP1_activity/data/PCA_CA_all/monomer/Gromos/proj2d_1vs2_mt.xvg", header = FALSE, fill = TRUE)
#rmsfx <- rmsf[c(1,2,4,6,8,10,12,14,16)]
pcax <- rename(pca, c("V1"="time", "V2"="PC1", "V3"="PC2"))
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  scale_fill_viridis_c() +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
#  theme_classic(base_size = 30, base_family = "Helvetica")
ggsave("2dplotPC1vPC2.monomer.GR.pdf",p, width=10, height=8, units="in")
#########################################
#########################################
pca.SH.A.GR <- pcax[c(0:1501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.A.GR, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-342,244) +
  xlim(-211,338)
ggsave("2dplotPC1vPC2.monomer.SH.A.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SH.B.GR <- pcax[c(1502:3001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.B.GR, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-342,244) +
  xlim(-211,338)
ggsave("2dplotPC1vPC2.monomer.SH.B.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.A.GR <- pcax[c(3002:4501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.A.GR, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-342,244) +
  xlim(-211,338)
ggsave("2dplotPC1vPC2.monomer.SNO.A.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.B.GR <- pcax[c(4502:6001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC2) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.B.GR, aes(x=PC1, y=PC2, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC2 (nm)") +
  labs(x="PC1 (nm)") +
  theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.title.x = element_text(size = rel(2.5)), axis.title.y = element_text(size = rel(2.5)), axis.text=element_text(size= rel(2.5)), legend.text = element_text(size = rel(1.5)), legend.title = element_text(size = rel(2.5))) +
  ylim(-342,244) +
  xlim(-211,338)  
ggsave("2dplotPC1vPC2.monomer.SNO.B.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
##########################################
####################
##########################################
pca = read.table("/Users/Matteo/Dropbox (ELELAB)/TRAP1_activity/data/PCA_CA_all/monomer/Amber/proj2d_1vs3_mt.xvg", header = FALSE, fill = TRUE)
#rmsfx <- rmsf[c(1,2,4,6,8,10,12,14,16)]
pcax <- rename(pca, c("V1"="time", "V2"="PC1", "V3"="PC3"))
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  scale_fill_viridis_c() +
  theme_classic() 
ggsave("2dplotPC1vPC3.monomer.Amber.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
pca.SH.A.AM <- pcax[c(0:1501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.A.AM, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-53,57) +
  xlim(-197,165)
ggsave("2dplotPC1vPC3.monomer.SH.A.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SH.B.AM <- pcax[c(1502:3001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.B.AM, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-53,57) +
  xlim(-197,165)
ggsave("2dplotPC1vPC3.monomer.SH.B.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.A.AM <- pcax[c(3002:4501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.A.AM, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-53,57) +
  xlim(-197,165)
ggsave("2dplotPC1vPC3.monomer.SNO.A.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.B.AM <- pcax[c(4502:6001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.B.AM, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-53,57) +
  xlim(-197,165)
ggsave("2dplotPC1vPC3.monomer.SNO.B.AM.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
##########################################
pca = read.table("/Users/Matteo/Dropbox (ELELAB)/TRAP1_activity/data/PCA_CA_all/monomer/Gromos/proj2d_1vs3_mt.xvg", header = FALSE, fill = TRUE)
#rmsfx <- rmsf[c(1,2,4,6,8,10,12,14,16)]
pcax <- rename(pca, c("V1"="time", "V2"="PC1", "V3"="PC3"))
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  scale_fill_viridis_c() +
  theme_classic() 
ggsave("2dplotPC1vPC3.monomer.Gromos.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SH.A.GR <- pcax[c(0:1501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.A.GR, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-134,60) +
  xlim(-211,338)
ggsave("2dplotPC1vPC3.monomer.SH.A.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SH.B.GR <- pcax[c(1502:3001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SH.B.GR, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-134,60) +
  xlim(-211,338)
ggsave("2dplotPC1vPC3.monomer.SH.B.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.A.GR <- pcax[c(3002:4501),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.A.GR, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-134,60) +
  xlim(-211,338)
ggsave("2dplotPC1vPC3.monomer.SNO.A.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################
#########################################
pca.SNO.B.GR <- pcax[c(4502:6001),c(1:3)]
p <- ggplot(pcax, aes(x=PC1, y=PC3) ) +
  stat_density_2d(data=pcax, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon", fill = "#9A9999") +
  stat_density_2d(data=pca.SNO.B.GR, aes(x=PC1, y=PC3, fill = ..level..), geom = "polygon") +
  scale_fill_viridis_c() +
  labs(y="PC3 (nm)") +
  labs(x="PC1 (nm)") +
  theme_classic() +
  ylim(-134,60) +
  xlim(-211,338)
ggsave("2dplotPC1vPC3.monomer.SNO.B.GR.pdf",p, width=10, height=8, units="in", scale=0.8)
#########################################

