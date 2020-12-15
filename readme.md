# TP NGS bats

readme du projet NGS

#Lancer un programme
ls -l (voir les droits que l'on a sur le programme)
chmod -x (ajouter le droit de l'executer)
./program.sh (lancer simple)
nohup ./program.sh >& path/nohupprogram.text & (lancer en arriere plan avec les commandes qui s'inscrivent dans le fichier text)

htop (afficher les programmes en cours)
ps (idem mais mieux)
kill identifiant (termine le programme vise)

# Telechargement de donnees de sequencage : downloaddonnees.sh
Telecharge les donnees dans 1 fichier "donnees", il faut se connecter avec le username et le password connu

# Controle qualite : programfastqc.sh
Les fichiers rendus par fastqc sont dans un dossier fastqc_data. Il faut regarder les fichier en .html. 
Inserer un fichier image de donnees

# Nettoyage des sequences : programtrimmomatic.sh
les donnees seront dans trimm_data.
Parametres : Illuminaclip:path/adapt.fasta:2:30:10 Headcrop:9 Minlen: 100
Le fichier adapt.fasta donne les séquences des adapteurs utilisés pour le sequencage à nettoyer du sequencage,2:30:10?
Headcrop=9?, 
Minlen=100, on elimine les reads plus petites que 100pdb.

# On rerun programfastqc.sh pour evaluer l'effet de trimmomatic
Inserer image avec le resultat plus bo

# Assemblage des sequencages : programtrinity.sh
--seqType fq --max_memory 14G --left liste1  --right liste2 --CPU 4 --SS_lib_type RF --output path/dossier
Attention liste1 et 2 doivent etre une suite de nom uniquement separes par des virgules ! Ce sont les fichiers avec les read dans 1 sens et dans l'autre. 

#Transdecodeur

# Creation d'une banque blast

# Blast


