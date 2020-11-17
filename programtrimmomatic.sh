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

#Recuperation des données 
reads=$data/"FASTQ"
libs="${reads}/Lib1_31_20_S1
${reads}/Lib2_31_20_S2
${reads}/Lib3_31_20_S3
${reads}/Lib4_31_20_S4
${reads}/Lib5_31_20_S5
${reads}/Lib6_31_20_S6"


#Loop for to run trimmomatic on every read
for lib in $libs
do 
java -jar /softwares/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 8 -phred33 ${lib}_R1_001.fastq.gz ${lib}_R2_001.fastq.gz ${lib}paired1.fq.gz ${lib}unpaired1.fq.gz ${lib}paired2.fq.gz ${lib}unpaired2.fq.gz ILLUMINACLIP:$data/adapt.fasta:2:30:10 HEADCROP:9 MINLEN:100

done




