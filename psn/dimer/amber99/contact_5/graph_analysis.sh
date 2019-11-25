!/bin/bash
xtc="traj.mol.ur.nojump_PROT_120-502ns.xtc"
#gro="sim.gro" or "model0.pdb" from the trajectory
#pdb=Protein Data Bank file - only if there are numeration issues
dat="hc-graph.dat"
datfilt="hc-graph_filt.dat"
gro="model0_120-502ns_chainID.pdb"
pdb="model0_120-502ns_chainID.pdb"
#write hubs
filter_graph -d $dat -o $datfilt -t 20.0
graph_analysis -a $datfilt -r $pdb -u -ub hubs.pdb 
graph_analysis -a $datfilt -r $pdb -c -cb con_comp.pdb

