
from Bio import SeqIO
records = SeqIO.parse("uniprot_sprot_plants.dat", "swiss")
count = SeqIO.write(records, "uniprot_sprot_plants.fa", "fasta")
print("Converted %i records" % count)
