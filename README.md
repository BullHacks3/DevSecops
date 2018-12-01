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
 $#                  | Number of commands line arguemnts sccript received
 $?                  | Contains exit status for last command
 ${#var}             | Used to get the length of variable
 ${#array[@]}        | Count the number of elements in the array
 ${!array[@]}        | To show all the indices in the array

### Arithemtic Tests
[[ arg1 OP arg2 ]]  |  Details
--------------------|---------------
      -eq           | Equality
      -gt           | Greater Than
      -lt           | Less Than
      -ne           | Not equal

### Difference between [ ] and [[ ]]

``` Basically [ is test command in linux 
    1. Harder to use
    2. Only use for portability (help test)
   [[ .. ]] is a bash extension
     1. Command with special syntac
     2. No quotes needed around variables  (help [[)
```
### Commmand Help
```
Output Commands
1. echo
	1.1 Prints its arguments to standard output,followed by a newline
	1.2 -n suppresses the new line
	1.3 -e allows use of escape sequences
		1.3.1 \t : tab
		1.3.2 \b backspace

2. printf
	2.1 Use to perform more sophisticated operations
	2.2 It makes use of format string
	2.3 Examples:-
		2.3.1 printf "Hello World \n"
		2.3.2 printf "Hello %s,Welcome " $USER
		2.3.3 printd "|%20s |%20s |%20s |\n" $(ls)
        2.4 -v option is used to store the output to a variable
		2.4.1 printf -v name "Hello World" ;printf $name
Input Commands
1. read
	1.1 Reads input into a variable
        1.2 -n or -N specifies number of characters
	1.3 -s suppress the output
	1.4 -p option for prompt
IFS [ Input Field Seperator ]
 
Standard Streams
	1.1 Three types i.e input,output,error
	1.2 Represented by number (file descriptor)
 	1.3 Standard Input (0) (/dev/stdin)
	1.4 Standard Output (1) (/dev/stdout)
	1.5 Standard Error (2) (/dev/stderr)
        1.6 /dev/null discards all data sent to it
Redirection
	1.1 Redirection 1
		1.1.1 Input redirection (<)
		1.1.2 Output redirection (>)
		1.1.3 Pipes ( ls | grep 'bakul')
 	1.2 Redirection 	
		1.2.1 2>/dev/null discards all errors
		1.2.2 1>&2 sends output to stderr
		1.2.3 2>&1 redirects stderr into stdout
		1.2.4 Sendinf both error and output to a single file( > log 2>&1)

Command Grouping
	1.1 Group commands with {}
	1.2 I/O redirection can be applied to whole group
	1.3 The status of group will be the status of the last command of the group.
	1.4 { echo "Hello";cd /; ls }

Variables
        1.1 Variables are the namespaces that are used to store the value
	1.2 declare command used for variable declaration
	1.3 declare -i num [ to hole only numeric values ]
	1.4 declare +i num [ unset the variable ]
	1.5 let command for c style executions
        1.6 Read Only variable are declare with -r attribute

Arrays
	1.1 Special type of data structure (variable),that can hold mutiple values
	1.2 Values can be stored and retrieved by index
	1.3 Storing a value
		1.3.1 x[0]="Bakul"
	1.4 Retrieving a value
		1.4.1 ${x[0]} -> to get single value
		1.4.2 ${x[@]} -> to get entire array
	1.5 Initialization of array
		1.5.1 array=(a e i o u)
	1.6 Bash arrays cannot be exported
	1.7 Bash 4 supports associative arrays
```
 

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

### Scirpt 7:- Length Of Variable   ###
```
#!/bin/bash
Variable="Bakul Gupta"
echo "The length of string ${Variable} is ${#Variable} "
```
```
Name of the script :- length_variable.sh
Command            :- bash length_variable.sh
Output             :- The length of string Bakul Gupta is 11 
```

### Scirpt 8:- While Loop   ###
```
#!/bin/bash

Initial=2
while [[ $Initial -ne 22 ]];
do
        echo $Initial
        Initial=$(($Initial+2))
done
```
```
Name of the script :- while.sh
Command            :- bash while.sh
Output             :- 
2
4
6
8
10
12
14
16
18
20
```

### Scirpt 9:-Simple For Loop Example   ###
```
#!/bin/bash

iterator="Hello this is example of simple for loop"

for i in $iterator;
do
	echo $i
done

```
```
Name of the script :- for_simple.sh
Command            :- bash for_simple.sh
Output             :- 
Hello
this
is
example
of
simple
for
loop
```

### Scirpt 10:- For Loop In C Style   ###
```
#!/bin/bash

for (( Initial=2;Initial<22;Initial=Initial+2 ))
do
	echo $Initial
done
```
```
Name of the script :- for_c_style.sh
Command            :- bash for_c_style.sh
Output             :- 
2
4
6
8
10
12
14
16
18
20
```
### Scirpt 11:- Case Example   ###
```
#!/bin/bash


Check=${1:-"Bakul"}
# If value of argumens is passed ,then it is assigned to Check variable,otherwise default value is set to Bakul

case $Check in
	BAKUL)
		echo "BAKUL found" ;;
	BaKuL)
		echo "BaKuL found" ;;
	Bakul)
		echo "Bakul found" ;;
	*)
		echo "No matching keyword found" ;;
esac
```
```
Name of the script :- case.sh
Command            :- bash case.sh
Output             :- Bakul found
Command		   :- bash case.sh BaKuL
Output             :- BaKuL found
Command            :- bash case.sh A
Output             :- No matching keyword found
```

### Scirpt 12:- Array In Bash   ###
```
#!/bin/bash

array=(First 2 Third 4 Fifth)
echo "Number of values in array is :- ${#array[@]}"
for i in ${array[@]};
do
	printf "%s\t" $i
done
printf "\n"

```
```
Name of the script :- array.sh
Command            :- bash array.sh
Output             :-
Number of values in array is :- 5
First	2	Third	4	Fifth	
```
