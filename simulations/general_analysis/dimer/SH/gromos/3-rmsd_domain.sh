gro=conf
xtc=traj_mol_ur_nojump
tpr=sim_prot_Mg
ndx=domains

"""
make_ndx -f $gro.gro -o domains.ndx <<eof
a 2377-2527|a 2743-2835|a 2991-3039|a 3266-3320|a 3468-3725|3
name 24 chainA_MD_alignment
a 1-2226
name 25 chainA_NTD
a 2227-5054
name 26 chainA_MD
a 5055-6531
name 27 chainA_CTD
a 8908-9058|a 9274-9366|a 9522-9570|a 9797-9851|a 9999-10256|3 
name 28 chainB_MD_alignment
a 6532-8757
name 29 chainB_NTD
a 8758-11585
name 30 chainB_MD
a 11586-13062
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
"""

