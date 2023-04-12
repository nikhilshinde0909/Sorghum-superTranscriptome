library(dplyr)
library(tidyverse)

data <- read.table('/home/mpilab/DEG_ST/leaf_gene_cont.csv', header = T, sep = ',')
data <- data %>% arrange(-V,-FL, -RI, -BL, -ANT, -SD)
data <- data[1:51,]
top_genes <- data %>% select(1)
write.table(top_genes, '/home/mpilab/DEG_ST/sorghum_leaf_top_genes.list', row.names = F, 
            col.names = T, sep = '\t', quote = F)

data1 <- read.table('/home/mpilab/DEG_ST/sorghum_leaf_top_genes.TSV', 
                    header = T,  sep = '\t')
data1 <- data1 %>%
  group_by(Description) %>%
  mutate(Description=paste0(Description, c("-"), 1:n()))

data <- inner_join(data1, data, by='Gene')
data <- data %>% select(2:8)
data <- as.data.frame(data)
class(data)

library(reshape)
data_melt <- melt(data)
data_melt <- data_melt %>% 
  mutate_if(is.numeric, round)

colnames(data_melt) <- c("Genes" ,"Growth_stages","Count")
head(data_melt)

# Create heatmap with ggplot2
library("ggplot2")
ggp1 <- ggplot(data_melt, aes(Growth_stages, Genes)) +                         
  geom_tile(aes(fill = Count)) +
  geom_text(aes(label = Count), color = "black", size = 3.5)
ggp1 
# save heatmap
tiff("/home/mpilab/DEG_ST/Leaf_top50_heatmap.tiff", units="cm", width = 25, height=30, res=300)
ggp1 + scale_fill_distiller(palette = "PuRd", direction = 1) +
  theme(axis.text.x = element_text(size = 14), axis.text.y = element_text(size = 13), 
        axis.title.x = element_text(size = 14)) +
  xlab("Growth stages") +
  ylab("") +
  ggtitle("Leaf")
dev.off()
