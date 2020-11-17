### What is a terminal ?

#

# A terminal an interface used to give commands to a computer. 

# You already use a lot of commands indirectly through the graphical interface

# of your computer (like creating or opening folders, for example).


### Why use a terminal ?

#

# A LOT of reasons. Here are 3 :

# 1. Automation/scalability. With one command line, it is 

#   possible to create 100 folders instantly, which is much more tedious 

#   through a graphical interface.   

# 2. Flexibility. Commands can take numerous and diverse inputs and options, 

#   referred to as arguments.

# 3. Availability. A graphical interface is a luxury ! Some programs (even 

#   some OS) just... don't have any. Thus, if you want to use a lot of programs

#   out there, you need the terminal.

### What does a terminal look like ?

#

# The terminal's input line has the following layout

#

# login@hostname:~/path$

#

# The name of the user, followed by '@' and the name of the machine indicate 

# "as who" you will execute commands. 

# Then, after ':', is indicated the spot "from where" the command is executed.

# A dollar sign ends the input prompt.

### What does a command look like ?

# 

# To run a command, one always starts with its name. It may be followed by

# options or arguments. Executing the command is done with the 'Enter' key.

# 

# For example, the command 'ls', lists the files and folders at the location

# it is run.


ls 


# We can add options to the command (usually options are preceded by a '-').


ls -a

ls -l

ls -al


# '-a' lists all the files and folders, including the hidden ones.

# '-l' lists files, with extra info such as size, date, etc.


# All commands or programs have a help page, which you can print in the terminal

# with the '--help' option.


ls --help


# Some commands take arguments, for example the 'echo' command outputs the 

# given text.


echo "Hello !" 

### What is bash ?

# 

# Bash is the name of the language you use to communicate with the machine.

# A bash script is a file, usually ending with the '.sh' extension (like the 

# you're reading right now), in which are a succession of commands you want 

# to run. As programmers know, scripts are very useful to execute multiple 

# chained commands. A bash script can be run by typing 'bash my_script.sh'

# in a terminal.

# 

# To keep track of what your script does, you can add comments, which are

# lines starting with a '#' symbol that the computer will ignore.

# <- like this.

#

### Common notation

#

# '*' = wildcard

# If you want to list all the files in the folder starting with 't', you can do 'ls t*'.

# 

# 'abc' = "abc" 

# Simple and double quotes have the same meaning

#

# '~' = $HOME = '/home/login/'

# The tilde is equivalent to the HOME variable, which is the path to the root of a user's folders.