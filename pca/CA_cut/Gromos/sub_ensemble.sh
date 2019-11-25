
gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder 184.8 -dropover 197.9 <<eof
0
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SH.A.GR.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder 34.2 -dropover 38.2 <<eof
1
0
eof
rm traj_cutPC1.pdb

gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder -50.7 -dropover -28.0 <<eof
0
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SH.B.GR.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder -46.8 -dropover 15.3 <<eof
1
0
eof
rm traj_cutPC1.pdb

gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder 3.7 -dropover 15.4 <<eof
0
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SNO.A.GR.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder -13.8 -dropover 4.5 <<eof
1
0
eof
rm traj_cutPC1.pdb

gmx_mpi trjconv -f traj_comb_mono.xtc -s traj.gro -o traj_cutPC1.pdb -drop comb_PC1.xvg   -dropunder -78.2 -dropover -50.1 <<eof
0
eof
gmx_mpi trjconv -f traj_cutPC1.pdb -s traj.gro -o traj_cutPC1PC2_SNO.B.GR.pdb -n index.pca.ndx -fit rot+trans -drop comb_PC2.xvg   -dropunder -6.1 -dropover 16.1 <<eof
1
0
eof
rm traj_cutPC1.pdb
