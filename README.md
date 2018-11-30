Shell Scripting Guide

Why Shell Scripting ?
-> Automate the redundant tasks
-> Provide to execute the commands from file

Who needs it ?
System administrators
Developers
Power Users


Bash Scripts are good at :-

1. File Manipulation
2. Running programs
3. Processing Text

Where bash fails :-

1. To do mathematical calculations ,binary data ,graphics { so can use python scripting for those purposes }
 
### What We Will Learn In this Tutorial  ###

# Basics of shell scripting
1. Input/Output
2. Variables
3. Conditinal execution (if,then.else.case)
4. Loops
5. Arithemtic
6. String Manipulation
7. Handling Script Arguments
8. Shell Functions

### Special Command  Used ###

Command              |          Explanation
---------------------|---------------------------------------------------
#!/bin/bash -x  :-   | Is used to on the debugging mode of the bash
set -x and set +x :- | If want to on the debugging mode between few lines

### Script 1:- Hello World Script ###
```
#!/bin/bash
echo "Hello World"
```
```
Name of the script :- hello_world.sh
Command            :- bash hello_world.sh
Output             :- Hello World
```

### Scirpt 2:- Command Line Argument ###
```
#!/bin/bash
echo "Hello $1"
```
```
Name of the script :- command_line_argument.sh
Command            :- bash command_line_argument.sh Bakul
Output             :- Hello Bakul
```

### Scirpt 3:- Command Substitution ###
```
#!/bin/bash
echo date
echo $(date)
```
```
Name of the script :- command_substitution.sh
Command            :- bash command_substituion.sh
Output             :- date
                      Fri Nov 30 19:54:14 IST 2018
```

### Scirpt 4:- Variable  ###
```
#!/bin/bash
Fname="B@kul"
Lname="Gupt@"

echo "Hello $Fname $Lname"
echo "Hello ${Fname} ${Lname}"
echo Hello $Fname $Lname
```
```
Name of the script :- variable.sh
Command            :- bash variable.sh
Output             :- Hello B@kul Gupt@
		      Hello B@kul Gupt@
                      Hello B@kul Gupt@
```

### Scirpt 5:- Read from user using prompt  ###
```
#!/bin/bash
read -p "Enter your name:- " name
echo "Hello $name"
```
```
Name of the script :- read_prompt.sh
Command            :- bash read_prompt.sh
Input :-
Enter your name:- Bakul Gupta
Output:-
Hello Bakul Gupta
```
### Scirpt 6:- If Check   ###
```
#!/bin/bash
Fname="Bakul"

if [ $Fname == "Bakul" ] ;
then
	echo "Hello Bakul"
fi
```
```
Name of the script :- if_check.sh
Command            :- bash if_check.sh
Output             :- Hello Bakul
```

