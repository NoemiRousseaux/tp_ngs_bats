 #!/bin/bash
 
# 
echo "usage: ./programphyml.sh gene_name"

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/donnees"
mkdir -p $data
cd $data


file_name=$data"/phylogeny/"$1

phyml -i $file_name"_aln.best.phyX" -d nt -m HKY85 -a e -c 4 -s NNI -b -1

mv -t $data"/arbres" $file_name"_aln.best.phyX_phyml_tree.txt"
mv -t $data"/arbres" $file_name"_aln.best.phyX_phyml_stats.txt"
