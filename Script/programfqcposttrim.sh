#!/bin/bash


#Quality test of sequences

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/data"
mkdir -p $data
cd $data

# Dossier specifique a ce programme pour l'output
data_fastqc="fastqc_data2"
mkdir -p $data_fastqc
cd $data_fastqc

#Recuperation des données 
home_trimm="/home/rstudio/data/mydatalocal/donnees/trimm_data"
trimm=$home_trimm/"*.gz"

#Loop for to run fastqc on every read
for sample in $trimm
do 
fastqc -o $data/$data_fastqc $sample
done