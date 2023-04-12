library(dplyr)

## Rio
Rio_slice <- read.table('/home/mpilab/GCN/Internode/C1+C20_new_NAC.csv', 
                    header = T, sep = ',')
Rio_slice <- Rio_slice %>% mutate(PCC_under_C1= paste0(1.1 -PCC_under_C1))

Rio_slice1 <- Rio_slice %>% group_by(TF_Family)%>% arrange(PCC_under_C1) %>% slice(1:50)

write.table(Rio_slice1, '/home/mpilab/GCN/Internode/C1+C20_NAC_slice.csv', row.names = F , col.names = T,
            sep = ',')
Rio_ID <- data.frame(Rio_ID = c(Rio_slice1$TF_gene_ID, Rio_slice1$gene_ID))
Rio_ID <- as.data.frame(Rio_ID[!duplicated(Rio_ID$Rio_ID),])
write.table(Rio_ID, '/home/mpilab/GCN/Internode/Rio_ID.TSV', row.names = F, 
            col.names = F, sep = '\t', quote = F)
## PR22
PR22_slice <- read.table('/home/mpilab/GCN/Internode/C10C2+_new_NAC.csv', 
                         header = T, sep = ',')
PR22_slice <- PR22_slice %>% mutate(PCC_under_C2= paste0(1.1 -PCC_under_C2))

PR22_slice1 <- PR22_slice %>% group_by(TF_Family)%>% arrange(PCC_under_C2) %>% slice(1:50)

write.table(PR22_slice1, '/home/mpilab/GCN/Internode/C10C2+_NAC_slice.csv', row.names = F , col.names = T,
            sep = ',')
PR22_ID <- data.frame(PR22_ID = c(PR22_slice1$TF_gene_ID, PR22_slice1$gene_ID))
PR22_ID <- as.data.frame(PR22_ID[!duplicated(PR22_ID$PR22_ID),])
write.table(PR22_ID, '/home/mpilab/GCN/Internode/PR22_ID.TSV', row.names = F, 
            col.names = F, sep = '\t', quote = F)