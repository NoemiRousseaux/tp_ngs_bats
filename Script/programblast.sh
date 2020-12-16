#!/bin/bash

#Recherche des homologues
echo "usage: ./programblast.sh gene_name"

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/donnees"
mkdir -p $data
cd $data

gene=$1
requete_dir=$data"/ISG_bat/all_aln"
requete=$requete_dir"/"$gene".fas"

if [ -e $requete ] ; then 
  echo $requete "exists"

  transcriptome=$data/"transdec_data/Trinity_RF.fasta.transdecoder.cds"
  bqtr_dir=$data"/blastdb"
  banquetrans=$bqtr_dir"/M_velifer_cds.db"
  db=$banquetrans.nhr

  mkdir -p $bqtr_dir

  #Etape 1 : on fait la banque avec la sortie de transdecodeur = transcriptome

  if [[ -s $db ]] ; then 
  echo "$db exists"
  else
  echo "$db is empty"
  /softwares/ncbi-blast-2.10.1+/bin/makeblastdb -in $transcriptome -dbtype nucl -parse_seqids -out $banquetrans
  fi ; 

  #Etape 2 : on compare les ISG candidats avec la banque issue de l'etape 1

  blast_sortie=$data"/homologue"

  #Creation dossier sortie 
  mkdir -p $blast_sortie

  # blast

  blast=$blast_sortie"/"$gene".blast"
  echo $blast
  if [[ -s $blast ]] ; then
  echo "$blast exist"
  else
  echo "bloup"
  /softwares/ncbi-blast-2.10.1+/bin/blastn -db $banquetrans -query $requete -evalue 1e-20 -outfmt 6 -out $blast
  fi ; 

######################################################## Filtrage de la sortie de BLAST

  ## Estimation moyenne de la longueur des genes
  nbchar=$(cat $requete | wc -c)
  # Nb de characteres dans le fichier 
  nbseq=$(cat $requete | grep ">" -c)
  # Nb de sequence --> chaque seq commence par un chevron
  lseq=$(echo "($nbchar/$nbseq)" | bc)
  # Donne nb de charactere par sequence ie la longueur, bc convertit en valeur numerique ce qui est dans le pipe

  echo "estimation de la longueur de la requete =" $lseq

  echo "selection des lignes dans la sortie de BLAST correspondant à un alignement longueur au moins 50% de la requete"
  target=$(echo "$lseq/2" | bc)
  echo "Environ" $target "bp"

  ###
  cat $blast | awk '{if($4>$target) {print $2 " " $4}}'
  # awk applique un action (ici print) sur le motif defini par un champ 
  #(ici on compare la taille du hit, colonne 4 avec la longueur estimee de la requete) Cat lit les fichiers
  
  # Affiche homologues
  
  homologs=$(cat $blast | awk '{if($4>'$target') {print $2}}' | sort | uniq)
  echo "sequence to retrieve:"
  echo $homologs
  homofile=$blast_sortie"/"$gene".fasta"
  
  # Supprime le fichier si il existe deja
  if [[ -s $homofile ]] ; then 
  rm $homofile
  fi ; 
  for seq in $homologs
    do
    /softwares/ncbi-blast-2.10.1+/bin/blastdbcmd -entry $seq -db $banquetrans -out tmp.fasta
    cat tmp.fasta >> $homofile
    # cat avec double chevron ajoute a la fin du fichier 
  done
  
  cat $requete $homofile > $blast_sortie"/"$gene"+Myovel${target}.fasta"
  # cat avec simple chevron sert à ecraser le fichier avec les fichiers qu'on lui donne à manger
  
else 
 echo "blip"
fi ; 
  