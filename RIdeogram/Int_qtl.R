library(dplyr)
library(tidyverse)
setwd('/home/mpilab/GCN/')
## Internode co-expressed genes
Rio <- read.table('Internode/Rio_ID.TSV', header = F)
Rio <- data.frame(Gene=Rio$V1, Rio=1)

##
PR22 <- read.table('Internode/PR22_ID.TSV', header = F)
PR22 <- data.frame(Gene=PR22$V1, PR22=1)

##
Int_qtl <- list(Rio, PR22) %>% reduce(full_join)
Int_qtl[is.na(Int_qtl)] <- 0
Int_qtl <- Int_qtl[!duplicated(Int_qtl),]
Int_qtl <- Int_qtl %>% mutate('Expression Type'= rowSums(.[2:3]))
Int_qtl <- Int_qtl %>% mutate(`Expression Type`= case_when(`Expression Type`==2 ~ 'Conserved',
                                                            `Expression Type`==1 ~ "Specific"))
Int_qtl1 <- Int_qtl[!Int_qtl$'Expression Type' =='Conserved',]
Rio1 <- Int_qtl1[, c(1,2,4)]
Rio1 <- Rio1[!Rio1$Rio==0,]
Rio1 <- Rio1 %>% select(1,3) %>% mutate('Expression Type'='Rio Specific')
write.table(Rio1, '/home/mpilab/PanT_new/Rio_qtl.TSV', row.names = F, col.names = T,
            quote = F, sep = '\t')
PR221 <- Int_qtl1[, c(1,3,4)]
PR221 <- PR221[!PR221$PR22==0,]
PR221 <- PR221 %>% select(1,3) %>% mutate('Expression Type'='PR22 Specific')
write.table(PR221, '/home/mpilab/PanT_new/PR221_qtl.TSV', row.names = F, col.names = T,
            quote = F, sep = '\t')
