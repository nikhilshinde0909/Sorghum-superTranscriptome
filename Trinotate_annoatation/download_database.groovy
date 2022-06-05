/***********************************************************
 ** Author: Nikhil Shinde <sd1172@srmist.edu.in>
 ** Last Update: 30/04/2022
 *********************************************************/

VERSION="1.00"

load args[0]
codeBase = file(bpipe.Config.config.script).parentFile.absolutePath
load codeBase+"/tools.groovy"

//output directory
blastdb_dir="blastdb"

download_uniprot = {
    output.dir=blastdb_dir
  produce("uniprot_sprot_plants.dat"){
      exec "wget  -O - https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/taxonomic_divisions/uniprot_sprot_plants.dat.gz| gunzip -c > uniprot_sprot_plants.dat"
  }
}

dat2fasta = {
    output.dir=blastdb_dir
   produce("uniprot_sprot_plants.fasta"){ 
    exec "$python $dat2fasta > $output.fasta"
   }
}

makeblastdb = {
    output.dir=blastdb_dir
   { 
    exec "$makeblastdb -in $input.fasta -dbtype prot"
   }
}

run {
  download_uniprot + dat2fasta + makeblastdb
}
