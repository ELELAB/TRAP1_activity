#In this folder the inputs and output from the step with modeller to model missing coordinates in chain A and B
#We collected 10 models for each chain 
#The .ali files contain the alignment used for Modeller where the missing residues are indicated by gaps (-) in the original structure
#The pdb entry 4IPE has been used as template
#The .py files is the modeller running script


##### We used MODELLER to build ten different models of each of the protomers of TRAP1 and reconstruct the missing regions in the X-ray template structure (PDB entry 4IPE). We chose the two models in which the long-missing loop in the Middle Domain (T639-I652) was reconstructed in an extended way, to not impose artificial contacts and used them for the pre.md and MD simulations. The selected models are:
-buckled protomer SH (chain A) /modeller/Modeller_MONOMER_trap1/Modeller/SH_chainA/TRAP1_chainA.B99990009.pdb
-Straight protomer SH (chain B)
/modeller/Modeller_MONOMER_trap1/Modeller/SH_chainB/TRAP1_chainB.B99990003.pdb

We used the same models for generating the SNO variants using VIENNA-PTM webserver ##### 
