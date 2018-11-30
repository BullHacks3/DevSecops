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


