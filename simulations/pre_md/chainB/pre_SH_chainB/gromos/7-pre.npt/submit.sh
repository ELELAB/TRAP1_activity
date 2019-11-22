#PBS -N SH_B_gromos_7pre
#PBS -l walltime=12:05:00
#PBS -l nodes=1:ppn=24

module purge
module load intel/compiler/2016.3 intel/mkl/11.3 openmpi/intel/1.10.3 gromacs/5.1.4 


cd $PBS_O_WORKDIR

t_now=$(date +%d%m-%H%M)".1node-24coresx1ntomp.out"

mpirun -n 24 gmx_mpi mdrun -ntomp 1 -s pre.npt.tpr -append -cpi state_prev.cpt -v -maxh 12 >& $t_now