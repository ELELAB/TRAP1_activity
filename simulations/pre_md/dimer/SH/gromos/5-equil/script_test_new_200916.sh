#!/bin/bash
#PBS -N dod4-5equil 
#PBS -l select=1:ncpus=36:mpiprocs=36:mem=32GB
#PBS -l walltime=15:02:00
#PBS -A LI05p_DynP53DB 

# go to submission dir
cd $PBS_O_WORKDIR

export OMP_NUM_THREADS=1

# load gromacs 5.1.2
module load profile/lifesc
module load autoload gromacs
t_now=$(date +%d%m-%H%M)".1node-36coresx1ntomp.out"
mpirun -np 36 mdrun_mpi -s equil.tpr -v -cpi -append -ntomp 1 -maxh 15 >& $t_now


