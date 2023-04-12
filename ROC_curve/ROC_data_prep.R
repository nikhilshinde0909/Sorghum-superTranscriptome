library(dplyr)
library(tidyverse)

# read table
SSRG <- read.table('/home/mpilab/DEXSEq/Rio/DEX_Rio_results.TSV', header = T, sep = '\t')
ST <- read.table('/home/mpilab/DEXSEq/Rio/DEX_Rio_ST_results.TSV', header = T, sep = '\t')

# truth
lower_cutoff = 0.05
upper_cutoff = 0.90
## SSRG
true_SSRG <- SSRG[SSRG$pvalue < lower_cutoff,]
#true_SSRG$score <- 1
false_SSRG <- SSRG[SSRG$pvalue > upper_cutoff,]
#false_SSRG$score <- 0
SSRG <- rbind(true_SSRG, false_SSRG)
SSRG <- na.omit(SSRG)
SSRG <- SSRG[,c('Gene', 'pvalue')]
## ST
true_ST <- ST[ST$pvalue < lower_cutoff,]
#true_ST$score <- 1
false_ST <- ST[ST$pvalue > upper_cutoff,]
#false_ST$score <- 0
ST <- rbind(true_ST, false_ST)
ST <- na.omit(ST)
ST <- ST[,c('Gene', 'pvalue')]
############
#take the intersection
true=true_ST$Gene[true_ST$Gene %in% true_SSRG$Gene]
false=false_ST$Gene[false_ST$Gene %in% false_SSRG$Gene]
length(true)
length(false)
score <-c(rep(1,length(true)),rep(0,length(false)))
Gene <-c(true,false)
intersect <- data.frame(Gene, score)

##
SSRG <- list(SSRG,intersect) %>% reduce(full_join, by = "Gene")
SSRG[is.na(SSRG)] <- 1
SSRG <- SSRG[!duplicated(SSRG$Gene),]
table(SSRG$score)


##
ST <- list(ST,intersect) %>% reduce(full_join, by = "Gene")
ST[is.na(ST)] <- 1
ST <- ST[!duplicated(ST$Gene),]
table(ST$score)

# q val normalization
#Min-Max normalization 

SSRG <- SSRG %>% mutate(padj = (pvalue-min(pvalue))/diff(range(pvalue)))
ST <- ST %>% mutate(padj = (pvalue-min(pvalue))/diff(range(pvalue)))

# randomize
seed<-0
set.seed(seed)
seed<<-seed+1
SSRG <- SSRG[sample(1:length(SSRG$Gene)),]
ST <- ST[sample(1:length(ST$Gene)),]

# write table
write.table(SSRG, '/home/mpilab/ROC_curve/SSRG.csv', row.names = F, col.names = T,
            sep = ',')

write.table(ST, '/home/mpilab/ROC_curve/ST.csv', row.names = F, col.names = T,
            sep = ',')