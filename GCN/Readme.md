# Gene co-expression studies between sweet sorghum Rio and non-sweet PR22 

The raw RNA-seq reads form both cultivar internode tissues were pre-prossesed with FastP and aligned to rRNA sequences by using HISAT2 and unmapped reads were obtatined for co-expression studies. Read count and normalization was done with featureCounts and DESeq2 repectively with Likelyhood Ratio Test. Finally, Gene co-expression network was constructed by using TO-GCN pipiline followed by network visualization with python modules networkx and pyVis.
