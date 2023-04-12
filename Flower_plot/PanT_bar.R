setwd('/home/mpilab/PanT_new/')
data <- read.table('PanT_bar.TSV', header = T, sep = '\t')
colnames(data)[c(4,11,12, 13,14,15,16)] <- c('Chinease amber','PI 329311', 'PI 506059',
                                             'PI 510757', 'PI 655972', 'PI 229841', '353')

library(reshape2)
library(dplyr)
library(ggplot2)
library(viridis)
library(hrbrthemes)
data <- melt(data)
colnames(data) <- c('Type', 'Genome', 'number')
# Small multiple
data$Type <- factor(data$Type, levels = c("Cloud", "Shell", "Core"))
##
tiff('PanT_bar.tiff', width = 20, height = 13, units = 'cm', res = 300 )
data %>% ggplot(aes(x = Genome, y = number, color=Type, fill =Type)) +
  geom_bar(position="stack", stat="identity", width = 0.75) +
  scale_color_viridis_d(alpha = 1, direction = -1, ) +
  scale_fill_viridis_d(alpha = 0.7, direction = -1,) +
  theme(axis.text.x = element_text(hjust = 1, angle = 40, size = 10)) +
  xlab('Sorghum genomes') +
  ylab("") +
  guides(color = FALSE, fill=guide_legend(title = "Gene families", reverse = T, ))
dev.off()
##
tiff('PanT_bar1.tiff', width = 20, height = 14, units = 'cm', res = 300 )
data %>% ggplot(aes(x = Genome, y = number, color=Type, fill =Type)) +
  geom_bar(position="stack", stat="identity", width = 0.75) +
  scale_color_viridis_d(alpha = 1, direction = -1, ) +
  scale_fill_viridis_d(alpha = 0.7, direction = -1,) +
  theme(axis.text.x = element_text(hjust = 1, angle = 40, size = 10), legend.position = 'top') +
  xlab('Sorghum genomes') +
  ylab("") +
  guides(color = FALSE, fill=guide_legend(title = "Gene families", reverse = T, ))
dev.off()

##
tiff('PanT_bar2.tiff', width = 20, height = 15, units = 'cm', res = 300 )
data %>% ggplot(aes(x = Genome, y = number, color=Type, fill =Type)) +
  geom_bar(position="stack", stat="identity", width = 0.75) +
  scale_color_viridis_d(alpha = 1, direction = -1, ) +
  scale_fill_viridis_d(alpha = 0.7, direction = -1,) +
  theme(axis.text.x = element_text(angle = 40,  hjust = 1, size = 10), legend.position = 'bottom') +
  xlab('Sorghum genomes') +
  ylab("") +
  guides(color = FALSE, fill=guide_legend(title = "Gene families", reverse = T, ))
dev.off()