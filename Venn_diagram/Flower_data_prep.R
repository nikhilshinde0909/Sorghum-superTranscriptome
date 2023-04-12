library(tidyverse)
library(dplyr)
library(venn)
library(RColorBrewer)
library(dendextend)
setwd('/home/mpilab/PanT_new/')


data <- read.table('PAV-SWEET1.TSV', header = T, sep = '\t')
Rio <- data[,c(1,11,17)]
Rio <- Rio[!Rio$PI329311==0,]
table(Rio$Category)
