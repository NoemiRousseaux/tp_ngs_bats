#!/bin/bash

#Identification des ORFs

# Dossier par defaut
data="/home/rstudio/data/mydatalocal/donnees"
mkdir -p $data
cd $data

# Dossier specifique a ce programme pour l'output
data_transd="transdec_data"
mkdir -p $data_transd
cd $data_transd
transd=$data/"transdec_data"

# Recuperation des donnees 
reads=$data/"trinity_data"

# Transdecodeur

TransDecoder.LongOrfs -t $reads/Trinity_RF.fasta --gene_trans_map $reads/"Trinity_RF.fasta.gene_trans_map" -S -O $transd
TransDecoder.Predict -t $reads/Trinity_RF.fasta --single_best_only  -O $transd
