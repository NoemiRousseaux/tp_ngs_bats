# TP NGS bats

readme du projet NGS

#Lancer un programme
ls -l (voir les droits que l'on a sur le programme)
chmod -x (ajouter le droit de l'executer)
./program.sh (lancer simple)
nohup ./program.sh >& path/nohupprogram.text & (lancer en arriere plan avec les commandes qui s'inscrivent dans le fichier text)

htop (afficher les programmes en cours)
ps (idem)
kill identifiant (termine le programme vise)

# Telechargement de donnees de sequencage = download

# Controle qualite : fastqc
Les fichiers rendus par fastqc sont dans un dossier fastqc_data

# Nettoyage des sequences : Trimmomatic

Illuminaclip:path/adapt.fasta:2:30:10 Headcrop:9 Minlen: 100

# Assemblage des sequencages : Trinity
--seqType fq --max_memory 14G --left liste1  --right liste2 --CPU 4 --SS_lib_type RF --output path/dossier
Attention liste1 et 2 doivent etre suite de nom uniquement separes par des virgules !
