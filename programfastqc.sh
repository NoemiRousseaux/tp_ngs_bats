#!/bin/bash

# Create a working directory:
cd /home/rstudio/data/mydatalocal/tp_ngs_bats/donnees/FASTQ/

# Create a directory where the data will be downloaded
mkdir -p fastqc_data
cd fastqc_data

#
for i in /home/rstudio/data/mydatalocal/tp_ngs_bats/donnees/FASTQ/*.gz
do 
fastqc [--o fastqc_data] $i
done