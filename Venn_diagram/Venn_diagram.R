#Read table 
Pangenome <- read.table('/home/mpilab/pan_transcriptome/Pangenome.txt', header = T)
Rio <- read.table('/home/mpilab/pan_transcriptome/Rio.txt', header = T)
BTX623 <- read.table('/home/mpilab/pan_transcriptome/BTX623.txt', header = T)
BTX642 <- read.table('/home/mpilab/pan_transcriptome/BTX642.txt', header = T)

#make single data list for venn diagram
library(dplyr)
library(ggvenn)
panTranscriptome <- list('Pangenome' = Pangenome$Pangenome, 'Rio' = Rio$Rio,
                         'BTX623'=BTX623$BTX623,'BTX642'=BTX642$BTX642)

#plot venn digram with ggvenn and save it
tiff("/home/mpilab/pan_transcriptome/PanTranscriptome.tiff", units="px", width = 4000,
     height=3000, res=250, pointsize = 5)
ggvenn(panTranscriptome, set_name_size = 8,text_size = 6, stroke_size = 1)
dev.off()
