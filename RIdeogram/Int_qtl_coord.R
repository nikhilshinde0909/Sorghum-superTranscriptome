library(dplyr)
library(tidyverse)
Rio <- read.table('/home/mpilab/PanT_new/RIdeogram_data/Rio_qtl_coord.TSV', 
                  header = F, sep = '\t')
Rio1 <- Rio %>% group_by(V4) %>% summarise(V1=V1, V2=min(V2), V3=max(V3))
Rio1 <- Rio1[!duplicated(Rio1),]
Rio1 <- Rio1 %>% select(2:4,1) %>% mutate(V3 =paste0(V2+200))
Rio1 <- Rio1 %>% arrange(V1,V2, V3)
write.table(Rio1, '/home/mpilab/PanT_new/RIdeogram_data/Rio_qtl_coord1.TSV',
            row.names = F, col.names = T, sep = '\t', quote = F)
