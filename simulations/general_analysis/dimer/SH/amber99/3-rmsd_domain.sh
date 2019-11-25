gro=conf
xtc=traj_mol_ur_nojump
tpr=sim_prot_Mg
ndx=domains

make_ndx -f $gro.gro -o domains.ndx <<eof
a 3672-3871|a 4187-4330|a 4571-4647|a 5020-5105|a 5349-5769|3
name 24 chainA_MD_alignment
a 1-3426
name 25 chainA_NTD
a 3427-7805
name 26 chainA_MD
a 7806-10162
name 27 chainA_CTD
a 13835-14034|a 14350-14493|a 14734-14810|a 15183-15268|a 15512-15932|3 
name 28 chainB_MD_alignment
a 10164-13589
name 29 chainB_NTD
a 13590-17968
name 30 chainB_MD
a 17969-20325
name 31 chainB_CTD
q
eof

g_rms -f $xtc.xtc -s $tpr.tpr -n $ndx.ndx -o rmsd_chainA_NTD.xvg <<eof
24
25
eof
g_rms -f $xtc.xtc -s $tpr.tpr -n $ndx.ndx -o rmsd_chainA_MD.xvg <<eof
24
26
eof
g_rms -f $xtc.xtc -s $tpr.tpr -n $ndx.ndx -o rmsd_chainA_CTD.xvg <<eof
24
27
eof
g_rms -f $xtc.xtc -s $tpr.tpr -n $ndx.ndx -o rmsd_chainB_NTD.xvg <<eof
28
29
eof
g_rms -f $xtc.xtc -s $tpr.tpr -n $ndx.ndx -o rmsd_chainB_MD.xvg <<eof
28
30
eof
g_rms -f $xtc.xtc -s $tpr.tpr -n $ndx.ndx -o rmsd_chainB_CTD.xvg <<eof
28
31
eof



