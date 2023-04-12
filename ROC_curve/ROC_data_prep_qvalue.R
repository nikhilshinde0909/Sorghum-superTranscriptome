library(dplyr)
library(tidyverse)
setwd('/home/mpilab/ROC_curve/')
##
SSRG <- read.table('SSRG.TSV', header = T, sep = '\t')
ST <- read.table('ST.TSV', header = T, sep = '\t')



# define the "Truth"
lower_cut=0.05  #true positive - p < 0.05
upper_cut=0.9   #false positive - p > 0.9 
#SSRG truth
true_SSRG <- SSRG[SSRG$qvalue < lower_cut,]
false_SSRG <- SSRG[SSRG$qvalue > upper_cut,]
SSRG <- rbind(true_SSRG, false_SSRG)

##

#ST truth
true_ST <- ST[ST$qvalue < lower_cut,]
false_ST <- ST[ST$qvalue > upper_cut,]
ST <- rbind(true_ST, false_ST)

#take the intersection
true=true_ST$Gene[true_ST$Gene %in% true_SSRG$Gene]
false=false_ST$Gene[false_ST$Gene %in% false_SSRG$Gene]
length(true)
length(false)
score <-c(rep(1,length(true)),rep(1,length(false)))
Gene <-c(true,false)
intersect <- data.frame(Gene, score)

##
SSRG <- list(SSRG,intersect) %>% reduce(full_join, by = "Gene")
SSRG[is.na(SSRG)] <- 0



##
ST <- list(ST,intersect) %>% reduce(full_join, by = "Gene")
ST[is.na(ST)] <- 0



# randomize
seed<-0
set.seed(seed)
seed<<-seed+1
SSRG <- SSRG[sample(1:length(SSRG$Gene)),]
ST <- ST[sample(1:length(ST$Gene)),]

# write table
write.table(SSRG, 'SSRG.csv', row.names = F, col.names = T,
            sep = ',')

write.table(ST, 'ST.csv', row.names = F, col.names = T,
            sep = ',')