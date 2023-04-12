setwd('/home/mpilab/PanT_new/')
data <- read.table('PanT_bar_proportion.TSV', header = T, sep = '\t')
library(dplyr)
data <- data %>% mutate(Core=paste0(round(Core/Total, 2)), Shell=paste0(round(Shell/Total, 2)),
                        Cloud=paste0(round(Cloud/Total,2)))
data <- data %>% mutate_(number=paste(round(number, 2)))
data <- data[,c(1:4)]
library(reshape2)
library(dplyr)
library(ggplot2)
library(viridis)
library(hrbrthemes)
data <- melt(data, id.vars = 'Genomes')
colnames(data) <- c('Genome','Type' ,'number')

# Small multiple
data$Type <- factor(data$Type, levels = c("Cloud", "Shell", "Core"))
##
tiff('PanT_bar_A.tiff', width = 20, height = 13, units = 'cm', res = 300 )
data %>% ggplot(aes(x = Genome, y = as.numeric(number), color=Type, fill =Type)) +
  geom_bar(position="stack", stat="identity", width = 0.75) +
  scale_y_percent() +
  scale_color_viridis_d(alpha = 1, direction = -1, ) +
  scale_fill_viridis_d(alpha = 0.7, direction = -1,) +
  theme(axis.text.x = element_text(hjust = 1, angle = 40, size = 10)) +
  xlab('Sorghum genomes') +
  ylab("") + 
  guides(color = FALSE, fill=guide_legend(title = "Gene families", reverse = T, ))
dev.off()
##
tiff('PanT_bar1A.tiff', width = 20, height = 14, units = 'cm', res = 300 )
data %>% ggplot(aes(x = Genome, y = as.numeric(number), color=Type, fill =Type)) +
  geom_bar(position="stack", stat="identity", width = 0.75) +
  scale_y_percent() +
  scale_color_viridis_d(alpha = 1, direction = -1, ) +
  scale_fill_viridis_d(alpha = 0.7, direction = -1,) +
  theme(axis.text.x = element_text(hjust = 1, angle = 40, size = 10), legend.position = 'top') +
  xlab('Sorghum genomes') +
  ylab("") +
  guides(color = FALSE, fill=guide_legend(title = "Gene families", reverse = T, ))
dev.off()

##
tiff('PanT_bar2A.tiff', width = 20, height = 15, units = 'cm', res = 300 )
data %>% ggplot(aes(x = Genome, y = as.numeric(number), color=Type, fill =Type)) +
  geom_bar(position="stack", stat="identity", width = 0.75) +
  scale_y_percent() +
  scale_color_viridis_d(alpha = 1, direction = -1, ) +
  scale_fill_viridis_d(alpha = 0.7, direction = -1,) +
  theme(axis.text.x = element_text(angle = 40,  hjust = 1, size = 10), legend.position = 'bottom') +
  xlab('Sorghum genomes') +
  ylab("") +
  guides(color = FALSE, fill=guide_legend(title = "Gene families", reverse = T, ))
dev.off()