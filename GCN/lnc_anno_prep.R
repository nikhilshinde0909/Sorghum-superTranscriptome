data <- read.table('/home/mpilab/nc_rna/blastn_nc_plncDB.TSV', header = F, sep = '\t')
annotation <- read.table('/home/mpilab/nc_rna/rnacentral_plncDB_annotation.TSV', 
                         header = F, sep = '\t')
library(dplyr)
data <- data %>% arrange(-V3, -V8)
data <- data[!duplicated(data$V1),]
data <- data[,c(1,2)]
colnames(data) <- c('gene_ID', 'Target') 
colnames(annotation) <- c('Target', 'LNC_Annotation')
library(tidyverse)
data1 <- list(data, annotation) %>% reduce(inner_join)
data1 <- data1[,c(1,3)]
write.table(data1, '/home/mpilab/GCN/lnc_annotation.csv', row.names = F, col.names = T, 
            sep = ',', quote = F)
