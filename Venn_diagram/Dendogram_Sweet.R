library(tidyverse)
library(dplyr)
library(venn)
library(RColorBrewer)
library(dendextend)
setwd('/home/mpilab/PanT_new/')
Rio <- read.table('/home/mpilab/Rio_annotation/PASA.pasa_assemblies_described_label.txt',
                  header = F, sep = '\t')

Rio <- data.frame(Gene=Rio$V2, Rio=1)
BTX623 <-read.table('/home/mpilab/BTX623_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')
BTX623 <- data.frame(Gene=BTX623$V2, BTX623=1)

BTX642 <- read.table('/home/mpilab/BTX642_annotation/PASA.pasa_assemblies_described_label.txt',
                     header = F, sep = '\t')
BTX642 <- data.frame(Gene=BTX642$V2, BTX642=1 )

RTX430 <- read.table('/home/mpilab/RTX430_annotation/PASA.pasa_assemblies_described_label.txt',
                     header = F, sep = '\t')
RTX430 <- data.frame(Gene=RTX430$V2, RTX430=1 )
SC187 <- read.table('/home/mpilab/SC187_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')

SC187 <- data.frame(Gene=SC187$V2, SC187=1)
Camber <- read.table('/home/mpilab/Chinease_amber_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')
Camber <- data.frame(Gene=Camber$V2, Camber=1)
Wray <- read.table('/home/mpilab/Wray_annotation/PASA.pasa_assemblies_described_label.txt',
                   header = F, sep = '\t')
Wray <- data.frame(Gene=Wray$V2, Wray=1)
Leoti <- read.table('/home/mpilab/Leoti_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')
Leoti <- data.frame(Gene=Leoti$V2, Leoti=1)
Grassl <- read.table('/home/mpilab/Grassl_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')
Grassl <- data.frame(Gene=Grassl$V2, Grassl=1)
PI329311 <- read.table('/home/mpilab/PI329311_annotation/PASA.pasa_assemblies_described_label.txt',
                     header = F, sep = '\t')
PI329311 <- data.frame(Gene=PI329311$V2, PI329311=1)
PI506069 <- read.table('/home/mpilab/PI506069_annotation/PASA.pasa_assemblies_described_label.txt',
                       header = F, sep = '\t')
PI506069 <- data.frame(Gene=PI506069$V2, PI506069=1)
PI510757<- read.table('/home/mpilab/PI510757_annotation/PASA.pasa_assemblies_described_label.txt',
                       header = F, sep = '\t')
PI510757 <- data.frame(Gene=PI510757$V2, PI510757=1)

sorghum_353 <- read.table('/home/mpilab/353_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')
sorghum_353 <- data.frame(Gene=sorghum_353$V2, '353'=1)

PI655972 <- read.table('/home/mpilab/PI655972_annotation/PASA.pasa_assemblies_described_label.txt',
                       header = F, sep = '\t')
PI655972 <- data.frame(Gene=PI655972$V2, PI655972=1)

PI229841 <-  read.table('/home/mpilab/PI229841_annotation/PASA.pasa_assemblies_described_label.txt',
                    header = F, sep = '\t')
PI229841 <- data.frame(Gene=PI229841$V2, 'PI 229841'=1)

data <- list(Rio, BTX623, BTX642, RTX430, SC187, 
             Camber, Wray, Leoti, Grassl, PI329311, PI506069, PI510757, 
             sorghum_353, PI655972, PI229841) %>% reduce(full_join, by='Gene')
data <- data[!duplicated(data$Gene),]
data <- data %>% arrange(desc(Gene), .by_group = T)
data[is.na(data) ] <- 0
data <- data %>% mutate(Category=rowSums(.[2:16]))
data1 <- data %>% mutate(Category= paste0(case_when(Category==15 ~ 'Core', Category >1 & Category < 15 ~ 'Shell',
                                                   Category==1 ~ 'Private')))
data2 <- data %>% mutate(Category= paste0(case_when(Category==15 ~ 'Core', Category >= 4 & Category < 15 ~ 'Shell',
                                                   Category < 4 ~ 'cloud')))

write.table(data1, 'PAV-SWEET1.TSV', col.names = T, row.names = F, sep = '\t',
            quote = F)
write.table(data2, 'PAV-SWEET2.TSV', col.names = T, row.names = F, sep = '\t',
            quote = F)
data3 <- data1[!(data1$Category=='Core'),]
data3 <- data3[,c(2:16)]
colnames(data3)[c(6,10,11,12, 13, 14, 15)] <- c('Chinease amber', 'PI 329311', 'PI 506069' ,'PI 510757', '353', 'PI 655372',
                                                'PI 229841')

data3 <- data.frame(t(data3))

dend <- data3 %>%
  dist() %>% 
  hclust() %>% 
  as.dendrogram()

# color pal
color_pellete <- brewer.pal(8, 'Dark2')
# Color in function of the cluster
tiff('SWEET_dendogram1.tiff', units = 'cm', width = 20, height = 15, 
     res = 300)
par(mar=c(1,1,1,7))
dend %>%
  set("labels_col", value = color_pellete, k=8) %>%
  set("branches_k_color", value = color_pellete, k = 8) %>%
  set("leaves_col", value = color_pellete, k = 8) %>% 
  set("leaves_pch", 19)  %>% 
  set("nodes_cex", 1) %>%
  plot(horiz =  TRUE, axes=FALSE, nodePar = list(cex = .007))
dev.off()