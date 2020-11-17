#! /bin/bash


# Note : bash scripts should have the first line defined as "#! /bin/bash"


# Note2 : Remember each command has a '--help' option


### To look/move around :

# Note : '.' = current folder, '..' = parent folder, '../..' = parent folder of parent folder...


# LiSt files/folders in given folder (defaults to current folder)

ls


# Change Directory 

cd path/to/directory



# MaKe a DIRectory

mkdir director_name


# make an empty file

touch the_file_name.txt


# ReMove a file (is IRREVERSIBLE !)

rm the_file_name.txt


# print a message

echo "My message"

### To peek inside files


# print the WHOLE file

cat the_file_name.txt


# print the first/last few lines

head the_file_name.txt

tail the_file_name.txt


### Joining commands


# '>' directs the output of the command to the given file (overwrites the file)

echo "Hello" > the_file_name.txt


# '>>' directs the output of the command to the given file (appends at the end of the file)

echo "Hello" >> the_file_name.txt


# '|' is called a pipe, it's usually made with <AltGr+6>

# The pipe passes the output of the command before it as the first argument of the command after it.


echo -e " 1\n 2\n 3\n 4\n 5\n 6\n 7\n 8\n 9\n 10\n" | head -n6


### Variables & Statements

# Note : no space between the variable name and the '='.

var_a="Covid"

var_b="19"

var_c="echo 'this is an echo'"


# Access the contents of a variable with '$var_name'

echo "$var_a"

# To have characters right after the variable, you have to use ${var_name} so bash understands

# these characters are not part of the variable name.

echo "${var_a}19"

echo "${var_a}$var_b is here"


# To execute a command stored in a variable, use ()

($var_c)


# Arithmetic happens within $(())

echo "${var_a}$((var_b + 1)) is near"


mkdir $var_a

ls

cd $var_a


# To make a list/array variable

var_c="19

20

21"


# for statement

for v in $var_c

do

    tmp="${var_a}${v}.txt"

    touch $tmp

    echo "This is ${var_a}${v}. Hello." > $tmp

done
# if statement, there MUST be space after '[' and before ']' 

if [ "a" = $var_b ] 

then

    echo "The universe is broken."

fi