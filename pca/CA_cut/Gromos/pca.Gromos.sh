#!/bin/bash

path_gmx=gmx_mpi


gmx_mpi make_ndx -f ../../../../../../simulations/monomer/new_box/SH_chainA/gromos/9-md/sim.tpr -o index.ref.ndx <<eof
del 0-50
ri 1-609
a CA
0 & 1
q
eof
$path_gmx trjconv -f ../../../../../../simulations/monomer/new_box/SH_chainA/gromos/9-md/traj_mol_ur_nojump.xtc -s ../../../../../../simulations/monomer/new_box/SH_chainA/gromos/9-md/sim.tpr -n index.ref.ndx -o traj.SH.A.Gro.xtc << eof
2
eof
rm index.ref.ndx

gmx_mpi make_ndx -f ../../../../../../simulations/monomer/new_box/SH_chainB/gromos/9-md/sim.tpr -o index.ref.ndx <<eof
del 0-50
ri 1-609
a CA
0 & 1
q
eof
$path_gmx trjconv -f ../../../../../../simulations/monomer/new_box/SH_chainB/gromos/9-md/traj_mol_ur_nojump.xtc -s ../../../../../../simulations/monomer/new_box/SH_chainB/gromos/9-md/sim.tpr -n index.ref.ndx -o traj.SH.B.Gro.xtc << eof
2
eof
rm index.ref.ndx


gmx_mpi make_ndx -f ../../../../../../simulations/monomer/new_box/SNO_chainA/gromos/9-md/sim.tpr -o index.ref.ndx <<eof
del 0-50
ri 1-609
a CA
0 & 1
q
eof
$path_gmx trjconv -f ../../../../../../simulations/monomer/new_box/SNO_chainA/gromos/9-md/traj_mol_ur_nojump.xtc -s ../../../../../../simulations/monomer/new_box/SNO_chainA/gromos/9-md/sim.tpr -n index.ref.ndx -o traj.SNO.A.Gro.xtc << eof
2
eof
rm index.ref.ndx


gmx_mpi make_ndx -f ../../../../../../simulations/monomer/new_box/SNO_chainB/gromos/9-md/sim.tpr -o index.ref.ndx <<eof
del 0-50
ri 1-609
a CA
0 & 1
q
eof
$path_gmx trjconv -f ../../../../../../simulations/monomer/new_box/SNO_chainB/gromos/9-md/traj_mol_ur_nojump.xtc -s ../../../../../../simulations/monomer/new_box/SNO_chainB/gromos/9-md/sim.tpr -n index.ref.ndx -o traj.SNO.B.Gro.xtc << eof
2
eof
rm index.ref.ndx



$path_gmx trjcat -f  traj.SH.A.Gro.xtc  traj.SH.B.Gro.xtc  traj.SNO.A.Gro.xtc  traj.SNO.B.Gro.xtc -o traj_comb_mono.xtc -settime <<eof
c
c
c
c
eof




$path_gmx make_ndx -f ../../../../../../simulations/monomer/new_box/SH_chainA/amber99/9-md/sim.tpr -o index.ref.ndx <<eof
del 0-50
ri 1-609
a CA
0 & 1
q
eof
$path_gmx convert-tpr -s ../../../../../../simulations/monomer/new_box/SH_chainA/amber99/9-md/sim.tpr -n index.ref.ndx -o sim.CA.tpr <<eof
2
eof

gmx_mpi trjconv -f traj_comb_mono.xtc -s sim.CA.tpr  -o traj.gro -b 0 -e 0  <<eof
2
eof

gmx_mpi make_ndx -f traj.gro -o index.pca.ndx <<eof
del 0-50
a CA
ri 484-501 | ri 504-507 | ri 516-519 | ri 523-531 | ri 549-552 | ri 557-568 | ri 570-588
q
eof

path_analysis=/data/user/shared_projects/trap1_activity/simulations/analysis_SH.SNO/pca/monomer/CA_cut/Gromos
path_index=/data/user/shared_projects/trap1_activity/simulations/analysis_SH.SNO/pca/monomer/CA_cut/Gromos
path_plot=/data/user/shared_projects/trap1_activity/simulations/analysis_SH.SNO/pca/monomer/CA_cut/Gromos

tpr=traj.gro
traj=traj_comb_mono.xtc

$path_gmx gyrate -f $path_index/$traj -s $path_index/$tpr -o ref_time.xvg  << eof
2
eof


$path_gmx covar -f $path_index/$traj -s $path_index/$tpr  -o eigenval.xvg -v eigenvec.trr -av average.pdb -l covar.log -ascii covar.dat -xpm covar.xpm -xpma covara.xpm -mwa -n index.pca.ndx << eof
1
0
eof

$path_gmx anaeig -f $path_index/$traj -s $path_index/$tpr -v eigenvec.trr -2d proj2d_1vs2.xvg -first 1 -last 2 -n index.pca.ndx << eof
1
0
eof
$path_gmx anaeig -f $path_index/$traj -s $path_index/$tpr -v eigenvec.trr -2d proj2d_1vs3.xvg -first 1 -last 3 -n index.pca.ndx << eof
1
0
eof


mkdir ED_eig1 ED_eig2 ED_eig3
cd ED_eig1
$path_gmx anaeig -f $path_index/$traj -s $path_index/$tpr  -v ../eigenvec.trr  -extr models.pdb  -first 1 -last 1 -nframes 10 -n ../index.pca.ndx  << eof
1
0
eof
cp ../dividi_pdb.pl .
perl dividi_pdb.pl
cd ..
cd ED_eig2
$path_gmx anaeig -f  $path_index/$traj -s $path_index/$tpr  -v ../eigenvec.trr  -extr models.pdb  -first 2 -last 2 -nframes 10 -n ../index.pca.ndx << eof
1
0
eof
cp ../dividi_pdb.pl .
perl dividi_pdb.pl
cd ..

cd ED_eig3
$path_gmx anaeig -f $path_index/$traj -s $path_index/$tpr  -v ../eigenvec.trr  -extr models.pdb  -first 3 -last 3 -nframes 10 -n ../index.pca.ndx << eof
1
0
eof
cp ../dividi_pdb.pl .
perl dividi_pdb.pl
cd ..
rm traj_comb_mono.xtc traj.SH.B.Gro.xtc traj.SH.A.Gro.xtc traj.SNO.A.Gro.xtc traj.SNO.B.Gro.xtc

