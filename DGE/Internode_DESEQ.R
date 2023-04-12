# Import the data
countdata <- read.table("/home/mpilab/DEG_ST/rio_internode_gene.counts", header=TRUE, sep = '\t',
                        row.names=1)
library(dplyr)
# Order the coloumns
countdata <- countdata[,order(colnames(countdata))]
countdata <- countdata %>% select(15:17, 9:11, 6:8, 4:5, 1:3, 12:14)
countdata <- as.matrix(countdata)
head(countdata)
(condition <- factor(c(rep("V", 3), rep("RI", 3), rep("FL", 3), rep("BL", 2), rep("ANT", 3), rep("SD", 3))))
library(DESeq2)
(coldata <- data.frame(row.names=colnames(countdata), condition))
dds <- DESeqDataSetFromMatrix(countData=countdata, colData=coldata, design=~condition)
dds
# Run the DESeq pipeline
dds <- DESeq(dds, test = 'LRT', reduced = ~1)


# Regularized log transformation for clustering/heatmaps, etc
rld <- rlogTransformation(dds)
head(assay(rld))
hist(assay(rld))

# Get differential expression results
res <- results(dds)
table(res$padj<0.05)
## Order by adjusted p-value
res <- res[order(res$padj), ]
## Merge with normalized count data
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)), by="row.names", sort=FALSE)
names(resdata)[1] <- "Gene"
head(resdata)
## Write results
write.table(resdata, file="/home/mpilab/DEG_ST/rio_internode_gene1.counts", row.names = F,
            col.names = T, sep = '\t', quote = F)

