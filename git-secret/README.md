# Introduction to Git secret

Git secret is a bash tool which is used to store the password or other critical information in the git repository by encrypting the data


### Comannds used to enable the git secret

Step 1:- Initiliase the git secret repo inside a git repository

```sh
git secret init
```

Step 2:- Add user to git secret , that have permission to decrypt the data

```sh
git secret tell bakul.g@serverguy.com
```

Step 3:- Generate a new gpg ke associated with the email-id

```sh
gpg2 --gen-key
```

Step 4:- Generate a file that containers critical information

```
Contents of Password.txt

Name:- Bakul Gupta
Password:- qwwertrydfghyr2314456ygyuwysees
```

Step 5:-  Now add this file to gitignore file of the git repository

```sh
echo Password.txt > .gitignore
```

Step 6:- Now add the file to git secret
```sh
git secret add Password.txt
```

Step 7 :- Now hide the git secret using the following command
```sh
git secret hide
```

==========================================================
### Few commands of git-secret at a glance

**1. git secret whoknows**
```sh
print the list of email address ,for each key in the keyring
```
**2. git secret usage**
```sh
tell about the various option used for the git secert command
such as addd|changes|clean|hide|init|remove
```


Also there are many other commands too , so for further documentation u can refer to this site:-
  [Git secret Official Website](http://git-secret.io/)

