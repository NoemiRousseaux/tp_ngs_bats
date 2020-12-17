 #!/bin/bash
 
# 
echo "usage: ./programprank.sh gene_name fastafile"

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/donnees"
mkdir -p $data
cd $data

# Dossier specifique a ce programme pour l'output
sortie=$data/"homologue"

gene=$data"/ISG_bat/all_aln/"$1".fas"
fasta=$sortie"/"$2".fasta"

if [ -e $fasta ] ; then 
  echo $fasta" exists"
  
  OUT=$data"/phylogeny"
  mkdir $OUT
  fichier_sortie=$OUT"/"$1"_aln"
  echo $fichier_sortie
  
  prank -gapext=0.5 -gaprate=0.005 -d=$fasta -o=$fichier_sortie
  prank -gapext=0.5 -gaprate=0.005 -d=$fasta +F -o=${fichier_sortie}F
 
 # F : gestion des gaps, apres une insertion il cherche pas a aligner aussi strictement
 # gaprate = ouverture des gaps; gapext = extension des gaps
 else 
 echo "blip"
fi ; 


## Conversion en phylip

trimal -in $fichier_sortie".best.fas" -out $fichier_sortie".best.phyX" -phylip 
  
  
  
  
  