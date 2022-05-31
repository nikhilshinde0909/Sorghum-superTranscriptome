#!/bin/bash
#PBS -N blat_pipe
#PBS -q workq
#PBS -l select=1:ncpus=16:mpiprocs=16
#PBS -j oe
#PBS -V
cd $PBS_O_WORKDIR
cat $PBS_NODEFILE > ./pbsnodelist
CORES='cat ./pbsnodelist|wc -l'
source /opt/data/software/intel/parallel_studio_xe_2018.1.038/psxevars.sh intel64
bpipe run -n 16 ~/blat_pipe/blat_pipe.groovy inputs.txt
