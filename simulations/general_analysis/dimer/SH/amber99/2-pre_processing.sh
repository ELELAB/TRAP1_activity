xtc=traj_comp
tpr=sim4
gro=conf

#grompp -f sim.mdp -c conf.gro -p start.top -o sim4.tpr

#make_ndx -f $gro.gro -o prot_Mg.ndx <<eof
#a 1-20326
#keep 24
#q
#eof

make_ndx -f $gro.gro -o chains.ndx <<eof
a 1-10163
name 24 chainA
a 10164-20326
name 25 chainB
24 & 3
name 26 chainA_CA
25 & 3
name 27 chainB_CA
24 | 25
name 28 chainAandB
q
eof

#trjconv -f $xtc.xtc -s $tpr.tpr -pbc mol -ur compact -o traj_mol_ur.xtc -n prot_Mg.ndx

#tpbconv -s $tpr.tpr -n prot_Mg.ndx -o sim_prot_Mg.tpr

#trjconv -f traj_mol_ur.xtc -s sim_prot_Mg.tpr -pbc nojump -o traj_mol_ur_nojump.xtc -n prot_Mg.ndx

trjconv -f $xtc.xtc -s $tpr.tpr -pbc mol -ur compact -o traj_mol_ur_PROT.xtc -n chains.ndx << eof
28
eof
tpbconv -s $tpr.tpr -n chains.ndx -o sim_PROT.tpr << eof
28
eof
trjconv -f traj_mol_ur_PROT.xtc -s sim_PROT.tpr -pbc nojump -o traj_mol_ur_nojump_PROT.xtc -n chains.ndx << eof
28
eof
#rm -f traj_mol_ur.xtc traj_mol_ur_PROT.xtc

#g_rms -f traj_mol_ur_nojump.xtc -s sim_prot_Mg.tpr -o rmsd.xvg << eof
#5
#5
#eof
#g_rms -f traj_mol_ur_nojump.xtc -s sim_prot_Mg.tpr -n chains.ndx -o rmsd_chainA.xvg <<eof
#3
#26
#eof
#g_rms -f traj_mol_ur_nojump.xtc -s sim_prot_Mg.tpr -n chains.ndx -o rmsd_chainB.xvg <<eof
#3
#27
#eof
#g_gyrate -f traj_mol_ur_nojump.xtc -s sim_prot_Mg.tpr -o gyrate.xvg <<eof
#1
#eof


"""
rmsf
 
mkdir rmsf_chainA rmsf_chainB
cd rmsf_chainA
j=0
z=20000
for ((i=1; i <=10; i++)); do
g_rmsf -f ../traj_mol_ur_nojump.xtc -s ../sim_prot_Mg.tpr -n ../chains.ndx -res -o rmsf$i.xvg -b $j -e $z << eof
26
eof
xvg2octave rmsf$i.xvg 
j=$(($j+20000))
z=$(($z+20000))
done
paste rmsf1.oct rmsf2.oct rmsf3.oct rmsf4.oct rmsf5.oct rmsf6.oct rmsf7.oct rmsf8.oct rmsf9.oct rmsf10.oct | awk '{print $1, " ",$2, " ",$4, " ",$6, " ", $8, " ", $10, " ", $12, " ", $14, " ", $16, " ", $18, " ", $20}' > all.rmsf.oct
cat all.rmsf.oct | awk '{sum=0; for(i=2; i<=NF; i++){sum+=$i}; sum/=NF; print $1, " ", " ", sum}' > AV_RMSF_chainA.oct
rm all.rmsf.oct
cd ../rmsf_chainB
j=0
z=20000
for ((i=1; i <=10; i++)); do
g_rmsf -f ../traj_mol_ur_nojump.xtc -s ../sim_prot_Mg.tpr -n ../chains.ndx -res -o rmsf$i.xvg -b $j -e $z << eof
27
eof
xvg2octave rmsf$i.xvg 
j=$(($j+20000))
z=$(($z+20000))
done
paste rmsf1.oct rmsf2.oct rmsf3.oct rmsf4.oct rmsf5.oct rmsf6.oct rmsf7.oct rmsf8.oct rmsf9.oct rmsf10.oct | awk '{print $1, " ",$2, " ",$4, " ",$6, " ", $8, " ", $10, " ", $12, " ", $14, " ", $16, " ", $18, " ", $20}' > all.rmsf.oct
cat all.rmsf.oct | awk '{sum=0; for(i=2; i<=NF; i++){sum+=$i}; sum/=NF; print $1, " ", " ", sum}' > AV_RMSF_chainB.oct
rm all.rmsf.oct
cd ../
"""
"""
trjconv -f traj_mol_ur_nojump.xtc -s sim_prot_Mg.tpr -fit rot+trans -dt 1500 -o movie.dt1500.pdb -n prot_Mg.ndx
"""
mkdir models
cd models
trjconv -f ../traj_mol_ur_nojump_PROT.xtc -s sim_PROT.tpr -fit rot+trans -dt 10000 -o model.pdb -sep -n chains.ndx << eof
28
eof



