#!/bin/bash

#Assemblage des sequences nettoyees

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/donnees"
mkdir -p $data
cd $data

# Dossier specifique a ce programme pour l'output
data_trinity="trinity_data"
mkdir -p $data_trinity
cd $data_trinity

#Recuperation des données 
home_trinity=$data/"trimm_data"

#Creation des deux listes des fichiers separes par des virgules
leftseq=$(ls $home_trinity/*R1_paired.fq.gz | paste -d "," -s)
rightseq=$(ls $home_trinity/*R2_paired.fq.gz | paste -d "," -s)

#On fait tourner Trinity
Trinity --seqType fq --max_memory 14G --left $leftseq  --right $rightseq --CPU 4 --SS_lib_type RF --output $data/$data_trinity
