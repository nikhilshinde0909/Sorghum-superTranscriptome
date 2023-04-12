SSRG <- read.table('/home/mpilab/ROC_curve/SSRG_ROC.csv', header = T, sep = ',')
ST <- read.table('/home/mpilab/ROC_curve/ST_ROC.csv', header = T, sep = ',')

SSRG$Method <- 'SSRG' 
ST$Method <- 'superTranscriptome' 
SSRG <- SSRG[, c(2:5)]
ST <- ST[, c(2:5)]
all <- rbind(SSRG,ST)

#write.table(all, '/home/mpilab/ROC_curve/all.csv', row.names = F, col.names = T,
 #           sep = ',')
#Make the plot
library(ggplot2)
cbPalette<-c("blue","red")
p = ggplot(data=all,aes(x=fpr,y=tpr,group=Method,colour=Method)) + geom_line() 
p = p + geom_abline(intercept=0,slope=1,linetype=2) + xlim(0,1) +ylim(0,1) + theme_bw()
p = p + xlab('False Positive Rate') + ylab('True Positive Rate') + theme(text = element_text(size=18))
p = p + scale_colour_manual(values=cbPalette)
p=p+theme(legend.position=c(0.72,0.2))
tiff('/home/mpilab/ROC_curve/DEU_ROC.tiff', width = 15, height = 15, units = 'cm', res = 400)
p
dev.off()