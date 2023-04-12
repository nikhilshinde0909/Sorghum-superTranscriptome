library(tidyverse)
library(venn)
library(RColorBrewer)
setwd('/home/mpilab/PanT_new/')
Rio <- read.table('/home/mpilab/Rio_annotation/PASA.pasa_assemblies_described_label.txt',
                  header = F, sep = '\t')

BTX623 <-read.table('/home/mpilab/BTX623_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')


BTX642 <- read.table('/home/mpilab/BTX642_annotation/PASA.pasa_assemblies_described_label.txt',
                     header = F, sep = '\t')


RTX430 <- read.table('/home/mpilab/RTX430_annotation/PASA.pasa_assemblies_described_label.txt',
                     header = F, sep = '\t')


SC187 <- read.table('/home/mpilab/SC187_annotation/PASA.pasa_assemblies_described_label.txt',
                     header = F, sep = '\t')

Camber <-  read.table('/home/mpilab/Chinease_amber_annotation/PASA.pasa_assemblies_described_label.txt',
                      header = F, sep = '\t')
Wray <- read.table('/home/mpilab/Wray_annotation/PASA.pasa_assemblies_described_label.txt',
           header = F, sep = '\t')
Leoti <- read.table('/home/mpilab/Leoti_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')


myCol <- brewer.pal(8, "Dark2")
# Venn
data1 <- list('Rio' = Rio$V2,
              'RTX430'=  RTX430$V2,'SC187'=  SC187$V2,
              'BTX623' =  BTX623$V2,
              'BTX642' =  BTX642$V2,
              'Chinease\namber'= Camber$V2,
              'Wray'= Wray$V2,
              'Leoti'= Leoti$V2)

tiff("Gene_classification_venn.tiff", units="cm", width = 25,
     height=25, res=300)
venn(data1, ilcs = 1.1, sncs = 1.3, ilabels = TRUE, ellipse = TRUE, opacity = 0.30, ggplot = TRUE, box = FALSE, 
     zcolor = myCol, cex = 0.8)
dev.off()

