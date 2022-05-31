# Locating superTranscripts on different sorghum genomes
The superTranscriptomic approach identified total 44,575 gene families in sweet sorghum population and single reference genome is not enought to cover all these information, beacuse these genes are came from 4-5 different sweet sorghum varieties. We have tried to lacate these superTranscripts four different genomes namely sorghum Pangenome, Rio, BTX623 and BTX642 reference genome by using blat with parameters "-minScore=200 -minIdentity=98".

We further classified aligned SuperTranscripts in to core (present on all 4 genome), shell (present on two genomes) and private (showed presence only specific genome) categories based on their presence on different genomes.

Finally we created venn diagram with ggvenn R package to visualize core, shell and private gene famlies among sweet sorghum population
