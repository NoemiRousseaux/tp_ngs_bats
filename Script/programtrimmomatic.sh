#!/bin/bash

#Nettoyage des séquences

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/donnees"
mkdir -p $data
cd $data

# Dossier specifique a ce programme pour l'output
data_trimm="trimm_data"
mkdir -p $data_trimm
cd $data_trimm
trimm=$data/"trimm_data"

#Recuperation des données 
reads=$data/"FASTQ"


#Loop for to run trimmomatic on every read
for n in 1 2 3 4 5 6 
do
java -jar /softwares/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 8 -phred33 ${reads}/Lib{n}_31_20_S{n}_R1_001.fastq.gz ${reads}/Lib{n}_31_20_S{n}_R2_001.fastq.gz ${trimm}Lib{n}paired1.fq.gz ${trimm}Lib{n}paired2.fq.gz ${trimm}Lib{n}unpaired1.fq.gz ${trimm}Lib{n}unpaired2.fq.gz ILLUMINACLIP:$data/adapt.fasta:2:30:10 HEADCROP:9 MINLEN:100

done




