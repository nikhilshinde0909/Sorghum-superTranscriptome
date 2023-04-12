setwd('/home/mpilab/PanT_new/RIdeogram_data/')
Rio_lnc <- read.table('Rio_qtl_lnc.TSV', header = F, sep = '\t')
Rio_TF <- read.table('Rio_qtl_TF.TSV', header = F, sep = '\t')
Rio_NAC <- read.table('Rio_qtl_nac.TSV', header = F, sep = '\t')
Rio_kpc <- read.table('Rio_qtl_kpc.TSV', header = F, sep = '\t')
library(dplyr)
Rio <- bind_rows(Rio_kpc, Rio_lnc, Rio_NAC, Rio_TF)
colnames(Rio) <- c('Chr', 'Start', 'End', 'Type')
Rio <- Rio %>% mutate(Shape=case_when(Type=='Known protien coding' ~ 'box',
                                      Type=='Transcription Factors' ~ 'triangle',
                                      Type=='NAC-TF' ~ 'triangle',
                                      Type == 'lncRNA' ~ 'circle'))
Rio <- Rio %>% mutate(color=case_when(Type=='Known protien coding' ~ 'f5a9b8',
                                      Type=='Transcription Factors' ~ 'ed7a3b',
                                      Type=='NAC-TF' ~ 'cf2765',
                                      Type == 'lncRNA' ~ '008000'))
Rio <- Rio[,c(4,5,1:3,6)]
write.table(Rio, 'Rio_qtl_random_RNAs.TSV', row.names = F, col.names = T, sep = '\t',
            quote = F)
###############
setwd('/home/mpilab/PanT_new/RIdeogram_data/')
PR22_lnc <- read.table('PR22_qtl_lnc.TSV', header = F, sep = '\t')
PR22_TF <- read.table('PR22_qtl_TF.TSV', header = F, sep = '\t')
PR22_NAC <- read.table('PR22_qtl_nac.TSV', header = F, sep = '\t')
PR22_kpc <- read.table('PR22_qtl_kpc.TSV', header = F, sep = '\t')
library(dplyr)
PR22 <- bind_rows(PR22_kpc, PR22_lnc, PR22_NAC, PR22_TF)
colnames(PR22) <- c('Chr', 'Start', 'End', 'Type')
PR22 <- PR22 %>% mutate(Shape=case_when(Type=='Known protien coding' ~ 'box',
                                        Type=='Transcription Factors' ~ 'triangle',
                                        Type=='NAC-TF' ~ 'triangle',
                                        Type == 'lncRNA' ~ 'circle'))
PR22 <- PR22 %>% mutate(color=case_when(Type=='Known protien coding' ~ 'f5a9b8',
                                        Type=='Transcription Factors' ~ 'ed7a3b',
                                        Type=='NAC-TF' ~ 'cf2765',
                                        Type == 'lncRNA' ~ '008000'))
PR22 <- PR22[,c(4,5,1:3,6)]
write.table(PR22, 'PR22_qtl_random_RNAs.TSV', row.names = F, col.names = T, sep = '\t',
            quote = F)
