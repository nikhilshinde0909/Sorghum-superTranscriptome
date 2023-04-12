#loading package
require(RIdeogram)
library(RColorBrewer)
setwd(dir = '/home/mpilab/Gene_densities/')
#loading karyotype
sb_karyotype <- read.table('sb_rio_karyotype.txt', sep = '\t',
                           header = T, stringsAsFactors = F)

#getting gene densities
sb_gene_density <- GFFex(input = "ST_PASA_genes.gff3", karyotype = 'sb_rio_karyotype.txt', 
                         feature = "exon", window = 1000000)

# Hexadecimal color specification 
col <- (brewer.pal(n = 8, name = 'Reds'))
col <- col[3:8]
# construing ideogram
ideogram(karyotype = sb_karyotype, overlaid =  sb_gene_density,
         colorset1 = col, output = 'superTranscriptome.svg')

# converting to tiff
svg2tiff('superTranscriptome.svg', file = 'superTranscriptome.tiff', dpi = 300)
#saving gene densities as table
write.table(sb_gene_density, "superTranscriptome_gene_densities.TSV", col.names = T, row.names = F,
            quote = F, sep = '\t')
