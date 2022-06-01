# BLAT Pipe

BLAT pipe is the pipeline designed to align superTranscripts to 4 different Sorghum reference genome to find their location on these genome. Since superTranscriptome covers all expresseed genes in sweet sorghum verities namely Rio, Keller, SIL05, Roma etc. 
Therefore single reference (S bicolor Rio) is not enough to identify their genomic locations.

In this study we have aligned assembled superTranscripts to 4 different sorghum reference genomes namely Pangenome, Rio, BTX623 and BTX642 by using BLAT with parameters "-minScore=200 -minIdentity=98".

# Usage 
The BLAT Pipe is automated with bpipe, we have to enter our input file paths in the file called "input.txt". Once input data is can run pipeline with bpipe as follows

{path to bpipe}/bpipe run -n 10 ~/blat_pipe/blat_pipe.groovy inputs.txt
