# Read tables
Pangenome <- read.table('/home/mpilab/pan_transcriptome/Pangenome.txt', header = T, sep = '\t')
Rio <- read.table('/home/mpilab/pan_transcriptome/Rio.txt', header = T, sep = '\t')
BTX623 <- read.table('/home/mpilab/pan_transcriptome/BTX623.txt', header = T, sep = '\t')
BTX642 <- read.table('/home/mpilab/pan_transcriptome/BTX642.txt', header = T, sep = '\t')

# Row bind
library(data.table)
sorghum <- rbindlist(list(Pangenome, Rio, BTX623, BTX642))

# Count gene presence number of times
gene_presence <- data.frame(table(sorghum))
colnames(gene_presence) <- c("Gene", "Presence_on_genomes")

# write table
write.table(gene_presence, '/home/mpilab/pan_transcriptome/gene_distribution.csv', row.names = F , col.names = T,
quote = F, sep = ',')

# gene classification table 
gene_distribution <- read.table('/home/mpilab/pan_transcriptome/gene_distribution.csv', header = T, sep = ',')
gene_clssification <- data.frame(table(gene_distribution$Type))

colnames(gene_clssification) <- c("Gene_Type", "Number")
library(dplyr)
gene_clssification <- gene_clssification %>% arrange(-Number)

# write table
write.table(gene_clssification, '/home/mpilab/pan_transcriptome/gene_classification.csv', row.names = F , col.names = T,
            quote = F, sep = ',')

# Draw pie chart

library(ggplot2)
library(tidyverse)
bar <- ggplot(gene_clssification, aes(x = "Gene Type", y = Number, fill = Gene_Type)) +
  geom_col(width = 1, alpha = 0.7) +
  geom_text(aes(label = Number), position = position_stack(vjust = 0.5)) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Save image
tiff("/home/mpilab/pan_transcriptome/gene_classification.tiff", units="px", width = 1500,
     height=1000, res=140, pointsize = 10)
bar + coord_polar(theta = "y") + scale_fill_brewer(palette = "Dark2")
dev.off()

