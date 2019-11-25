#!/bin/bash
xtc="traj_mol_ur_nojump_PROT_120-502ns.xtc"
#gro="sim.gro" or "model0.pdb" from the trajectory
#pdb=Protein Data Bank file - only if there are numeration issues
gro="model0_120-502ns_chainID.pdb"
pdb="model0_120-502ns_chainID.pdb"


pyinteraph -s $gro -t $xtc -r $pdb -f --hc-graph hc-graph.dat  --ff-masses amber99sb  --hc-co 5 --hc-residues ALA,ILE,LEU,VAL,PHE,TRP,TYR,MET,PRO,ARG,HIS,LYS,GLU,ASP,ASN,GLN,SER,THR,CYS

