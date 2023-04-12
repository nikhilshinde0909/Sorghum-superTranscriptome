#
data <- read.table('/home/mpilab/DEG_ST/rio_internode_gene1.counts', header = T, sep = '\t')
library(dplyr)
data <- data %>% select(1, 8:24)
data1 <- data %>% 
  mutate(ANT= (Rio.ANT.I1+Rio.ANT.I2+Rio.ANT.I3)/3, FL= (Rio.FL.I1+Rio.FL.I2+Rio.FL.I3)/3,
         BL = (Rio.BL.I1+Rio.BL.I2)/2, RI = (Rio.RI.I1+Rio.RI.I2+Rio.RI.I3)/3 , SD= (Rio.SD.I1+Rio.SD.I2+Rio.SD.I3)/3,
         V = (Rio.V.I1+Rio.V.I2+Rio.V.I3)/3)
data2 <- data1 %>% select(1,24,22,20,21,19,23)
data2 <- data2 %>% arrange(-V,-RI,-FL,-BL,-ANT,-SD)
# write table 
write.table(data2, '/home/mpilab/DEG_ST/internode_gene_cont.csv', sep = ',', col.names = T, 
            row.names = F, quote = F)


