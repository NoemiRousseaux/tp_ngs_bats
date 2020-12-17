# TP NGS bats

readme du projet NGS

#Lancer un programme
ls -l (voir les droits que l'on a sur le programme)
chmod u+x (ajouter le droit de l'executer)
./program.sh (lancer simple)
nohup ./program.sh >& path/nohupprogram.text & (lancer en arriere plan avec les commandes qui s'inscrivent dans le fichier text)

htop (afficher les programmes en cours)
ps (idem mais mieux)
kill identifiant (termine le programme vise)

# Telechargement de donnees de sequencage : downloaddonnees.sh
Telecharge les donnees dans 1 fichier "donnees", il faut se connecter avec le username et le password connu

# Controle qualite : programfastqc.sh
Les fichiers rendus par fastqc sont dans un dossier fastqc_data. Il faut regarder les fichier en .html. Rapport sous forme graphique.
Inserer un fichier image de donnees

# Nettoyage des sequences : programtrimmomatic.sh
Les donnees seront dans trimm_data.
Parametres : Illuminaclip:path/adapt.fasta:2:30:10 Headcrop:9 Minlen: 100 Trailing: 26
Le fichier adapt.fasta donne les sequences des adapteurs utilises pour le sequencage a nettoyer du sequencage, 2:30:10 30 et 10 sont des paramètres de qualite, 2 c'est pour autoriser des appariements imparfait avec la seq de l'adaptateur. 
Headcrop=9, on coupe les 9 premieres bases de chaque sequence, hexamer au debut du a la technique de manipulation
Minlen=100, on elimine les reads plus petites que 100pdb.
Trailing 26, on elimine les fragments dont le score de qualite est inf a 26. 

# On rerun programfastqc.sh pour evaluer l'effet de trimmomatic
Inserer image avec le resultat plus bo

# Assemblage des sequencages : programtrinity.sh
Paramètres : --seqType fq --max_memory 14G --left liste1  --right liste2 --CPU 4 --SS_lib_type RF --output path/dossier
Attention liste1 et 2 doivent etre une suite de nom uniquement separes par des virgules ! Ce sont les fichiers avec les read dans 1 sens et dans l'autre. Le dossier de sortie est trinity_data

#Detection des ORFs dans l'assemblage : programtransdecodeur.sh
Parametres : 
LongOrfs : -t path/fichier.fasta --gene_trans_map path/fichier.fasta.gene_trans_map -S -O path/dossier
Predict : -t path/fichier.fasta --single_best_only  -O path/dossier
Sortie des fichiers dans transdec_data. Trans_map permet d'identifier les sequences. Peut tourner en nohup car assez long. 


# Creation d'une banque blast, blast avec la banque et filtrage des donnees : programblast.sh nomdugene
Program cplxe avec plusieurs if --> ne creer le fichier d'analyse que si il n'existe pas, ou qu'il est vide etc ou que si le gène donné existe bien. Beaucoup de lignes et de fonctions sont expliquees au sein du programme. 
Dossier de sortie : blastdb pour makeblastdb, homologue pour blastn et blastdbcmd.
Parametres : makeblastdb -in path/fichier.fasta.transdecoder.cds -dbtype nucl -parse_seqids -out path/dossier
  --> on blast en nucleotides, parseseqid necessaire car on est format fasta.
blastn -db path/dossier -query path/fichier.fas -evalue 1e-20 -outfmt 6 -out path/dossier
  --> valeur de evalue à decider, format de sortie 6 est tabulaire
blastdbcmd -entry path/fichier -db path/dossier -out tmp.fasta


# PRANK +trimal

# Phyml



