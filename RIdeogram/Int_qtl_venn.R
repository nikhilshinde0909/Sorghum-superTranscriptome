setwd('/home/mpilab/GCN/')
Rio <- read.table('Internode/Rio_ID.TSV', header = F,
                  sep = '\t')

PR22 <- read.table('Internode/PR22_ID.TSV', header = F,
                   sep = '\t')

data1 <- list('Rio' = Rio$V1,
              'PR22' =PR22$V1)
library(venn)

myCol <- c('#ff0044', '#800080', '#4800ff')
tiff("/home/mpilab/PanT_new/Int_qtl_venn.tiff", units="cm", width = 20,
     height=15, res=300)
venn(data1, ilcs = 1.1, sncs = 1.3, ilabels = TRUE, ellipse = TRUE, opacity = 0.30, ggplot = TRUE, box = FALSE, 
     zcolor = myCol, cex = 0.8)
dev.off()