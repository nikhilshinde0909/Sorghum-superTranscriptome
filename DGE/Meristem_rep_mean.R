data <- read.table('/home/mpilab/DEG_ST/rio_meristem_gene1.counts', header = T, sep = '\t')
library(dplyr)
data <- data %>% select(1,8:16)
data1 <- data %>% 
  mutate(V = (Rio.V.M1+Rio.V.M2+Rio.V.M3)/3,
         RI = (Rio.RI.M1+Rio.RI.M2+Rio.RI.M3)/3,
         FL= (Rio.FL.M1+Rio.FL.M2+Rio.FL.M3)/3)
data2 <- data1 %>% select(1,11:13)
data2 <- data2 %>% arrange(-V,-FL,-RI)
# write table 
write.table(data2, '/home/mpilab/DEG_ST/meristem_gene_cont.csv', sep = ',', col.names = T, 
            row.names = F, quote = F)