/***********************************************************
 ** Author: Nikhil Shinde <sd1172@srmist.edu.in>
 ** Last Update: 30/04/2022
 *********************************************************/

VERSION="1.00"
 
blast_options="-max_target_seqs 1 -outfmt 6"
signalp_options="-f short -n"
rnammer_options="--path_to_rnammer"

load args[0]
codeBase = file(bpipe.Config.config.script).parentFile.absolutePath
load codeBase+"/tools.groovy"
load codeBase+"/trinotate_stages/"
