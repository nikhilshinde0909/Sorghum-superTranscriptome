data <- read.table('/home/mpilab/GCN/Internode/hub_genes.csv', header = T , sep = ',')
tf <- read.table('/home/mpilab/GCN/Internode/TF_annotation.txt', header = F , sep = '\t')
colnames(tf) <- c('annotation', 'TF_gene_ID')
library(tidyverse)
data1 <- list(tf,data) %>% reduce(inner_join)
data1 <- data1 %>% group_by(annotation) %>% mutate(annotation=paste0(annotation, '-', 1:n()))
write.table(data1, '/home/mpilab/GCN/Internode/hub_genes.csv', col.names = T , row.names = F,
           quote = F, sep = ',')
