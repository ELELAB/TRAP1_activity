gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder -29.8 -dropover -22.6 <<eof
0
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SH.A.AM.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder -51.3 -dropover -45.8 <<eof
1
0
eof
rm traj_cutPC1.pdb

gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder -12.7 -dropover -1.09 <<eof
0 
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SH.B.AM.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder -10.1 -dropover 15.3 <<eof
1
0
eof
rm traj_cutPC1.pdb


gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder -36.2 -dropover -36.1 <<eof
0 
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SNO.A.AM.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder 7.2 -dropover 7.3 <<eof
1
0
eof
rm traj_cutPC1.pdb

gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder -12.0 -dropover 7.9 <<eof
0 
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SNO.B.AM.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder 28.1 -dropover 45.7 <<eof
1
0
eof
rm traj_cutPC1.pdb

