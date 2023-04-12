data <- read.table('/home/mpilab/PanT_new/PanT_PCA.csv', header = T, sep = ',')
data$Type = c('Sweet', 'Grain', 'Grain', 'Grain', 'Grain', 'Sweet', 'Sweet', 'Sweet', 'Cellulosic',
              'Cellulosic', 'Cellulosic', 'Cellulosic', 'Wild progenitor', 'Forage', 'Grain')
data <- data[,c(1,2,20429,3:20428)]
write.table(data, '/home/mpilab/PanT_new/PanT_PCA.csv', col.names = T,
            row.names = F, sep = ',', quote = F)
