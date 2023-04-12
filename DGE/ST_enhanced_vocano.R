library(EnhancedVolcano)

# Leaf
Leaf <- read.table("/home/mpilab/DEG/rio_leaf_gene.counts", header = T, sep = '\t', 
                   row.names = 1)
Leaf2 <- subset(Leaf, !is.na(Leaf$log2FoldChange))
L1 <- EnhancedVolcano(Leaf2,
                lab = rownames(Leaf2),
                x = 'log2FoldChange',
                y = 'pvalue',
                title = 'Leaf',
                subtitle = NULL,
                caption = paste0("total = ", nrow(Leaf2), " Genes"),
                captionLabSize = 18,
                pCutoff = 10e-08)

# Internode
Internode <- read.table("/home/mpilab/DEG/rio_internode_gene.counts", header = T, sep = '\t', 
                   row.names = 1)
Internode2 <- subset(Internode, !is.na(Internode$log2FoldChange))
I1 <- EnhancedVolcano(Internode2,
                      lab = rownames(Internode2),
                      x = 'log2FoldChange',
                      y = 'pvalue',
                      title = 'Internode',
                      subtitle = NULL,
                      caption = paste0("total = ", nrow(Internode2), " Genes"),
                      captionLabSize = 18,
                      pCutoff = 10e-08)

# Meristem
Meristem <- read.table("/home/mpilab/DEG/rio_meristem_gene.counts", header = T, sep = '\t', 
                        row.names = 1)
Meristem2 <- subset(Meristem, !is.na(Meristem$log2FoldChange))
M1 <- EnhancedVolcano(Meristem2,
                      lab = rownames(Meristem2),
                      x = 'log2FoldChange',
                      y = 'pvalue',
                      title = 'Meristem',
                      subtitle = NULL,
                      caption = paste0("total = ", nrow(Meristem2), " Genes"),
                      captionLabSize = 18,
                      pCutoff = 10e-08)
library(cowplot)
tiff("/home/mpilab/DEG/Volcano_plot.tiff", units="cm", width = 50, height=40, res=200)
cowplot::plot_grid(L1, I1, M1, ncol=2, labels= NULL)
dev.off()

tiff("/home/mpilab/DEG/Volcano_plot2.tiff", units="cm", width = 60, height=30, res=200)
cowplot::plot_grid(L1, I1, M1, ncol=3, labels= NULL)
dev.off()