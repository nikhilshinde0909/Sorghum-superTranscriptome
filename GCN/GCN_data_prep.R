library(dplyr)
library(tidyverse)

# Read Table
Rio_Int <- read.table('/home/mpilab/DEG_ST/internode_gene_cont.csv', header = T, sep = ',')
PR22_Int <- read.table('/home/mpilab/PR22/internode_gene_cont.csv', header = T, sep = ',')
## Merge
Int <- list(Rio_Int, PR22_Int) %>% reduce(full_join, by='Gene')
# Write Table
write.table(Int, '/home/mpilab/GCN/Internode.TSV', sep = '\t', col.names = F, row.names = F, 
            quote = F)

# Read Table
Rio_Leaf <- read.table('/home/mpilab/DEG_ST/leaf_gene_cont.csv', header = T, sep = ',')
PR22_Leaf <- read.table('/home/mpilab/PR22/leaf_gene_count.csv', header = T, sep = ',')
## Merge
Leaf <- list(Rio_Leaf, PR22_Leaf) %>% reduce(full_join, by='Gene')
# Write table
write.table(Leaf, '/home/mpilab/GCN/Leaf.TSV', sep = '\t', col.names = F, row.names = F, 
            quote = F)

# Read Table
Rio_Mer <- read.table('/home/mpilab/DEG_ST/meristem_gene_cont.csv', header = T, sep = ',')
PR22_Mer <- read.table('/home/mpilab/PR22/meristem_gene_cont.csv', header = T, sep = ',')
## Merge
Meristem <- list(Rio_Mer, PR22_Mer) %>% reduce(full_join, by='Gene')
# Write Table
write.table(Meristem, '/home/mpilab/GCN/Meristem.TSV', sep = '\t', col.names = F, row.names = F, 
            quote = F)