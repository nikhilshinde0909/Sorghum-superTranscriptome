data <- read.table('/home/mpilab/DEG_ST/rio_leaf_gene1.counts', header = T, sep = '\t')
library(dplyr)

data <- data %>% select(1, 8:21)
data1 <- data %>% 
  mutate(V = (Rio.V.L3)/1,
         RI = (Rio.RI.L1+Rio.RI.L2+Rio.RI.L3)/3,
         FL= (Rio.FL.L1+Rio.FL.L2+Rio.FL.L3)/3,
         BL = (Rio.BL.L1+Rio.BL.L2+Rio.BL.L3)/3, 
         ANT= (Rio.ANT.L2)/1, 
         SD= (Rio.SD.L1+Rio.SD.L2+Rio.SD.L3)/3)
data2 <- data1 %>% select(1,16:21)
data2 <- data2 %>% arrange(-V,-FL,-RI,-BL,-ANT,-SD)
# write table 
write.table(data2, '/home/mpilab/DEG_ST/leaf_gene_cont.csv', sep = ',', col.names = T, 
            row.names = F, quote = F)
