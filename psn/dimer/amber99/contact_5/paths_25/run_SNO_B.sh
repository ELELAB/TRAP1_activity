#!/bin/bash
#to run paths from SNO site of chain A to other PSN residues
# to run as run_SNO-B.sh B-342CYS 
pdb="model0_120-502ns_chainID.pdb"
dat="hc-graph_filt.dat"
plength="25"
#syntax "B-14PHE"
#prepare folders
mkdir SNO-B
cd SNO-B
 
# Declare an array of string with type of target nodes
a=$(cat ../nodelist | tr '\n' ' ')
declare -a StringArray=($a)
#declare -a StringArray=("SYSTEM-46LYS" "SYSTEM-63GLU" "SYSTEM-62MET" "SYSTEM-180THR" "SYSTEM-162LYS" )

# Iterate the string array using for loop
for i in ${StringArray[@]}; do
        mkdir $i
	cd $i
        graph_analysis -r ../../$pdb -a ../../$dat  -p -r1 $1 -r2 $i -l $plength -d  > log_path_$1_$i
cd ../
done
echo "FINISHED LOOP MUTATION SITE $1 FOR chain B!"



 
