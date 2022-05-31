/***********************************************************
 ** Author: Nikhil Shinde <sd1172@srmist.edu.in>
 ** Last Update: 30/04/2022
 *********************************************************/


blat_rio = {
    produce("rio.psl"){
       exec "$pblat $pblat_options$threads $Rio $superTrancriptome $output.psl"
    }
}


rio_targets = {
    from("rio.psl") produce("rio.txt"){
       exec "cut -f 10 $input.psl | sort -u > $output.txt"
    }
}


blat_pangenome = {
    produce("pangenome.psl"){
       exec "$pblat $pblat_options$threads $Pangenome $superTrancriptome $output.psl"
    }
}


pangenome_targets = {
    from("pangenome.psl") produce("pangenome.txt"){
       exec "cut -f 10 $input.psl | sort -u > $output.txt"
    }
}

blat_btx623 = {
    produce("btx623.psl"){
       exec "$pblat $pblat_options$threads $BTX623 $superTrancriptome $output.psl"
    }
}


btx623_targets = {
    from("btx623.psl") produce("btx623.txt"){
       exec "cut -f 10 $input.psl | sort -u > $output.txt"
    }
}


blat_btx642 = {
    produce("btx642.psl"){
       exec "$pblat $pblat_options$threads $BTX642 $superTrancriptome $output.psl"
    }
}


btx642_targets = {
    from("btx642.psl") produce("btx642.txt"){
       exec "cut -f 10 $input.psl | sort -u > $output.txt"
    }
}


blat_pipe = segment { 
	      blat_rio + rio_targets +
              blat_pangenome + pangenome_targets +
	      blat_btx623 + btx623_targets +
              blat_btx642 + btx642_targets
	      }
