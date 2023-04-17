from Bio import AlignIO
from Bio import RNA
from Bio import SeqIO
from Bio import Seq
import os

file="total_nc_rna.fasta"
format="fasta"
output="total_nc_rna.sto"
records = SeqIO.parse(file, format)
records = list(records) # make a copy, otherwise our generator
                        # is exhausted after calculating maxlen
maxlen = max(len(record.seq) for record in records)

# pad sequences so that they all have the same length
for record in records:
    if len(record.seq) != maxlen:
        sequence = str(record.seq).ljust(maxlen, '.')
        record.seq = Seq.Seq(sequence)
assert all(len(record.seq) == maxlen for record in records)

# write to temporary file and do alignment
output_file = '{}_padded.fasta'.format(os.path.splitext(file)[0])
with open(output_file, 'w') as f:
    SeqIO.write(records, f, 'fasta')
msa = AlignIO.read(output_file,format)
ss = RNA.predictStruct(msa,'RNAalifold')
msa.setSS(ss)
AlignIO.write(msa,output,'stockholm')
