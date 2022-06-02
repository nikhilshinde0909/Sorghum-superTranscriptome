/***********************************************************
 ** Author: Nikhil Shinde <sd1172@srmist.edu.in>
 ** Last Update: 30/04/2022
 *********************************************************/

//output directory
homology_dir="homology_files"

blastx = {
    output.dir=homology_dir
    produce("blastx.outfmt6"){
       exec "$blastx -query $unannotated_regions -db $uniprot -num_threads $threads $blast_options $output.outfmt6"
    }
}

blastp = {
    output.dir=homology_dir
    produce("blastp.outfmt6"){
       exec "$blastp -query $longest_orfs -db $uniprot -num_threads $threads $blast_options $output.outfmt6"
    }
}

hmmscan = {
    output.dir=homology_dir
    produce("TrinotatePFAM.out","pfam.log"){
       exec "$hmmscan --cpu $threads --domtblout $output.out $pfam $longest_orfs > $output.log"
    }
}

signalp = {
    output.dir=homology_dir
    produce("signalp.out"){
       exec "$signalp $signalp_options $output.out $longest_orfs"
    }
}
