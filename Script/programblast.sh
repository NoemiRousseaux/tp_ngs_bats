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
  banquetranscriptome=$bqtr_dir"/M_velifer_cds.db"
  db=$banquetranscriptome.nhr

  mkdir -p $bqtr_dir

  #Etape 1 : on fait la banque avec la sortie de transdecodeur = transcriptome

  if [[ -s $db ]] ; then 
  echo "$db exists"
  else
  echo "$db is empty"
  /softwares/ncbi-blast-2.10.1+/bin/makeblastdb -in $transcriptome -dbtype nucl -parse_seqids -out $banquetranscriptome
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
  /softwares/ncbi-blast-2.10.1+/bin/blastn -db $banquetranscriptome -query $requete -evalue 1e-20 -outfmt 6 -out $blast
  fi ; 
else 
 echo "blip"
fi ; 