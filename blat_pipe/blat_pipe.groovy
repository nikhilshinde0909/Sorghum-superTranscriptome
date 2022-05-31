/***********************************************************
 ** Author: Nikhil Shinde <sd1172@srmist.edu.in>
 ** Last Update: 30/04/2022
 *********************************************************/

VERSION="1.00"
 
pblat_options="-minScore=200 -minIdentity=98 -threads="
 
codeBase = file(bpipe.Config.config.script).parentFile.absolutePath
load args[0]
load codeBase+"/tools.groovy"
load codeBase+"/blatpipe_stages/blat.groovy"

run_check = {
    doc "check that the data files exist"
    produce("checks_passed") {
        exec """
            echo "Running blat pipe version $VERSION" ;
	    echo "Using ${bpipe.Config.config.maxThreads} threads" ;
            echo "Checking for the data files..." ;
	    for i in $Rio $Pangenome $superTrancriptome $BTX623 ; 
                 do ls $i 2>/dev/null || { echo "CAN'T FIND ${i}..." ;
		 echo "PLEASE FIX PATH... STOPPING NOW" ; exit 1  ; } ; 
	    done ;
            echo "All looking good" ;
            echo "running  blat pipe version $VERSION.. checks passed" > $output
        ""","checks"
    }
}

nthreads=bpipe.Config.config.maxThreads

run { run_check + blat_pipe }
