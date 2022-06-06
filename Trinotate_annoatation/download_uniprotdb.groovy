/***********************************************************
 ** Author: Nikhil Shinde <sd1172@srmist.edu.in>
 ** Last Update: 30/04/2022
 *********************************************************/

VERSION="1.00"

out_dir="blastdb"

codeBase = file(bpipe.Config.config.script).parentFile.absolutePath
load codeBase+"/tools1.groovy"

//output directory

download_uniprot = {
  produce("uniprot_sprot_plants.dat"){
      exec "wget  -O - https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/taxonomic_divisions/uniprot_sprot_plants.dat.gz| gunzip -c > uniprot_sprot_plants.dat"
	}
}

dat2fasta = { 
    exec "$python /opt/data/home/nikhil/Softwares/dat2fasta.py"
}

makeblastdb = { 
    exec "$anaconda/makeblastdb -in uniprot_sprot_plants.fa -dbtype prot"
}

makedir = {
    exec "mkdir $out_dir"
}

movedb = {
    exec "mv uniprot_sprot_plants* $out_dir"
}


nthreads=bpipe.Config.config.maxThreads

run {download_uniprot + dat2fasta + makeblastdb + makedir + movedb}
