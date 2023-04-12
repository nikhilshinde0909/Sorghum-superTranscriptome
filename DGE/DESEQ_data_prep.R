library(dplyr)

data <- read.table('/home/mpilab/DEG_ST/gene.counts', header = T, sep = '\t')
data <- data %>% select(1,7:54)

leaf <- data %>% select(1, ends_with(c('L1','L2','L3')))
internode <- data %>% select(1, ends_with(c('I1','I2','I3')))
meristem <- data %>% select(1, ends_with(c('M1','M2','M3')))

write.table(leaf, "/home/mpilab/DEG_ST/rio_leaf_gene.counts", row.names = F,
            col.names = T, sep = '\t', quote = F)

write.table(internode, "/home/mpilab/DEG_ST/rio_internode_gene.counts", row.names = F,
            col.names = T, sep = '\t', quote = F)

write.table(meristem, "/home/mpilab/DEG_ST/rio_meristem_gene.counts", row.names = F,
            col.names = T, sep = '\t', quote = F)