tpr=sim4

make_ndx -f $tpr.tpr -o center_atom.ndx << eof
r 313 & chain A & 3
q
eof

trjconv -center -f traj_comp.xtc -o traj_centered.xtc -n center_atom.ndx -s $tpr.tpr -pbc mol -ur tric << eof
24
0
eof

g_mindist -f traj_centered.xtc -s $tpr.tpr -od mindist_center.xvg -pi << eof
1
eof

"""
xvg2octave min-dist-pbc_center.xvg
awk '$2 <= 0.9' min-dist-pbc_center.oct > minbad_pbc.oct
awk 'END { print NR }' minbad_pbc.oct > minbad_number_pbc.oct
rm minbad_pbc.oct
""" 
