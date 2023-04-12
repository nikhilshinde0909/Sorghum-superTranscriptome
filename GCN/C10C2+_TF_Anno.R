##
library(dplyr)
library(tidyverse)
setwd('/home/mpilab/GCN/')
data <- read.table('Internode/C10C2+.csv', header = T , sep = ',')
colnames(data) <- c('TF_gene_ID', 'coexpression_type', 'gene_ID', 'PCC_under_C1', 'PCC_under_C2')
TF_anno <- read.table('/home/mpilab/GCN/TF_annotation.csv', header = T, sep = ',')
TF_anno <- TF_anno %>% group_by(TF_Family) %>% mutate(TF_Family=paste0(TF_Family, '-', 1:n()))
data1 <- list(TF_anno, data) %>% reduce(inner_join)
Target_anno <- read.table('/home/mpilab/GCN/TF_annotation1.csv', header = T, sep = ',')
Target_anno <- Target_anno %>% group_by(Target_Family) %>% mutate(Target_Family=paste0(Target_Family, '-', 1:n()))
data1 <- list(data1, Target_anno) %>% reduce(full_join)
lnc_anno <- read.table('/home/mpilab/GCN/lnc_annotation.csv', header = T, sep = ',')
data2 <- list(lnc_anno, data1) %>% reduce(full_join)
data2 <- data2[!duplicated(data2),]
data2 <- data2[!is.na(data2$coexpression_type),]
data2 <- data2 %>% group_by(TF_gene_ID) %>% arrange(desc(PCC_under_C1))
data2 <- data2 %>% mutate(Target = coalesce(Target_Family, LNC_Annotation))
data2 <- data2 %>% mutate(Target = coalesce(Target, gene_ID))
data3 <- data2[!is.na(data2$coexpression_type),]
data3 <- data3[,c(1,9,3,4:7)]
data2 <- data3 %>% arrange(desc(PCC_under_C2))


write.table(data3, '/home/mpilab/GCN/Internode/C10C2+_new.csv', row.names = F , col.names = T,
            sep = ',')