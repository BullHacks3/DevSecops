#! /bin/bash

#read -p "Enter the old domain name             :- " ODOMAIN
#read -p "Enter the new domain name             :- " NDOMAIN
#read -p "Enter the complete path of sql file   :- " OSLQP
#read -p "Enter the complete path of public_html:- " OPUBLIC


###################################################################################################
                ###CODE FOR HARDCODED LINKS IN THE FILE ###
####################################################################################################
#echo " ";
#echo " ";
#tput setaf 1;echo "Hardcoded Links for the domain $ODOMAIN ,that need to be changed after migration :-"

#tput sgr0;grep -r $ODOMAIN $OPUBLIC | cut -f 1 -d ":" | sort | uniq -u ;


#########################################################################################################
                 ###CODE FOR FINDING ENTRIES IN DATABASE TABLES ###
#########################################################################################################
#echo " ";
#echo " ";

#tput setaf 1; echo "DATABASE TABLES WHERE THE ENTRIES FOR $ODOMAIN IS PRESENT :- ";

#tput sgr0;
#grep $ODOMAIN $OSQLP | cut -d ' ' -f 3 | sort | uniq -u
#grep $ODOMAIN  $OSLQP | cut -d ' ' -f 3 | sort | uniq -u


####################################################################################################################


#read -p "Enter the  path of public_html :- " OPATH

#tput setaf 2;echo "The entered path is :- $OPATH "

##########################################################################################################

###STEP 2:- Searching for wp-config file :-###

finding()
{
tput setaf 2;read -p "Enter the  path of public_html :- " OPATH;

#find $OPATH -name "wp-config.php";
FILE=${OPATH}wp-config.php;
echo "Checking for file at location:- $FILE";
if [ -f "$FILE" ];
   then
   tput setaf 2; echo " wp-config.php file is found :-";
    return 0;
     else
    tput setaf 1; echo "No wp-config file is found :-";
    return 5;
fi
}
finding
while [ $? -eq 5 ];
do
   finding
done

#echo "$FILE"
##################################################################################
###STEP 3:- Extracting  the database details from the wp-config file ###         #
##################################################################################
DBNAME=$(egrep -w  'DB_NAME' $FILE |awk -F, '{print $2}'|awk -F\' '{print $(NF-1)}')
DBUSER=$(egrep -w  'DB_USER' $FILE |awk -F, '{print $2}'|awk -F\' '{print $(NF-1)}')
DBPASS=$(egrep -w  'DB_PASSWORD' $FILE |awk -F, '{print $2}'|awk -F\' '{print $(NF-1)}')
tput setaf 3;
echo "The database details are:- "
echo "The DB_NAME  is :- $DBNAME";
echo "The DB_USER is :-  $DBUSER";
echo "The DB_PASS is :-  $DBPASS";

################################################################################
###STEP 4:- Finding out the old  domain name ###
##########################################################################
mysql -u $DBUSER -p$DBPASS -D $DBNAME -e 'Select option_value from wp_options where option_name="home";' > temp.txt;
cat temp.txt | sed -n 2p >try.txt 
rm -rf temp.txt
HOST=$(cat try.txt | cut -c 8-)
echo "The value of old_domain_name is :- " $HOST
#########################################################################################################
                 ###CODE FOR FINDING ENTRIES IN DATABASE TABLES ###
#########################################################################################################
echo " ";
echo " ";
mysqldump -u $DBUSER -p$DBPASS $DBNAME > temp.sql
tput setaf 1; echo "DATABASE TABLES WHERE THE ENTRIES FOR $ODOMAIN IS PRESENT :- ";

tput sgr0;
grep $HOST temp.sql | cut -d ' ' -f 3 | sort | uniq 
#grep $ODOMAIN  $OSLQP | cut -d ' ' -f 3 | sort | uniq -u


####################################################################################################################


#read -p "Enter the  path of public_html :- " OPATH

#tput setaf 2;echo "The entered path is :- $OPATH "

##########################################################################################################

#echo " ";
#echo " ";
tput setaf 1;echo "Hardcoded Links for the domain $ODOMAIN ,that need to be changed after migration :-"

tput sgr0;
grep -r $HOST $OPATH | cut -f 1 -d ":" | sort | uniq |egrep '.html$|.php$|.xml|.css|.js|.log' > first.txt
cat first.txt
cat first.txt >second.txt
#rm -rf first.txt

###########################################################################################################
   ###REPLACE SRCIPT ####
#########################################################################################################
#:'
echo " ";
echo " ";

read -p "Do u want to replace the old domain with new domain :- " CHOICE

case $CHOICE in
    [Yy]* )
   echo "You have pressed yes"
   read -p "Enter the new domain :- " NDOMAIN;;
    [Nn]* ) exit;;
      * ) exit;;
 esac

#cat second.txt
while read p;
do
  cat $p | sed 's+'$HOST'+'$NDOMAIN'+g' > $p

done <second.txt

#rm -rf second.txt change.txt

sed -i 's+'$HOST'+'$NDOMAIN'+g' temp.sql;
mysql -u $DBUSER -p$DBPASS -D $DBNAME <temp.sql;
rm -rf temp.sql;
#'
