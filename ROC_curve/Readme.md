# Diffrential Exon Usage (DEU) analysis and ROC curve

Diffrential Exon Usage comparison between superTranscriptome and SSRG was done with DEXSeq with RNASeq datasets from six timepoints from leaf, meristem and internode tissues. The ROC curve showing comparison was plotted by obtaining per gene q-values from DEXSeq. Finally, ROC curve was plotted by splitting datasets into 70% train and 30% by using Sci-kit-learn python module with Logistic regression method. Similarly, confusion matrix for both was also prepared with same by using KNeighborsClassifier and confusion matix sub-module
