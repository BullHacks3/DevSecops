# SCRIPT TO CHANGE THE LINKS AFTER MIGRATION OF WORDPRESS SITE


## PURPOSE 

  - Ease of replacing the old domain links with new domain after wordpress migration

## New Features!
 -One click replacement of all the links present in the database as well as any hardcoded link present in the files(.php,.html,.js,.css) of the wordpress direcotry

## Usage
Wordpress migrate is a script which is used to  fullfill the requirement for the migration of wordpress site from one domain to another domain


### Installation

Requires a linux platform for the execution of script 
Only dependency is the availability of bash [Bourne Again Sheel]

```sh
$ chmod +x wordpress_migrate.sh
$ ./wordpress_migrate.sh
```

When the script runs
```sh
$ Enter the public_html :-  /var/www/demo/public_html/
```
The path is to be entered by the user

Now the script runs ,if it successfully find out the wp-config file in
# /var/www/demo/public_html/wp-config.php
Then it will enumerate the database deatils automatically, and also  find the database tables where the old_domain entry (say http://olddomain.com) is present

# In case if it doesn't contains wp-config.php in the required path, then it will again ask for the path from the user

Now it afterwards ,it will ask from the user whether the user want to replace the old domain with the new domain or not

```sh
Do u want to replace the old domain with new domain :-
```
If the  user press Y/y ,then the script will proceed otherwise it will terminate

# Consider the user press Y/y key ,then further proceedings are taken into consideration
```sh
You have pressed yes
Enter the new domain :- www.newdomain.com
```
Now after that ,it will change the the www.old_domain.com to the www.newdomain.com ,now after restarting the server 

## In case of ubuntu apache 
```sh
sudo service apache restart
```

## In case of centos
```sh
 sudo service httpd restart
```

### Note:- Clear all the cache before accessing the new website after migration ###




