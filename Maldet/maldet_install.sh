### Script to Install the Maldet on the host operating system
#! /bin/bash

### VARIABLES USED 
# EMAIL="qwerty@gmail.com"
# CODEDIR =/home/bakul

#This function will install the maldet on the system
function maldet_install()
{
### Checking whether the maldet software is already available or not
if which maldet > /dev/null 2>&1; then
   echo "Maldet is already installed"
else
   echo "Installing process for maldet increases"

   ### Step 1:- Download the latest tar of the maldet
   echo "Downloading the maldet*.tar  file"
   wget http://www.rfxn.com/downloads/maldetect-current.tar.gz


   ### Step 2:- Extract the tar 
   echo "Extracting the maldet file"
   DIRNAME=$(tar -zxvf maldetect*.tar.gz | head -1 | cut -f1 -d"/")

   ### Step 3:- Remove the maldect tar
   rm -rf $DIRNAME
   tar -zxvf maldetect*.tar.gz

   echo " Removing the maldet tar file"
   rm -rf maldetect*.tar.gz

   ### Step 4  :- Change the directory to the maldet folder
   echo "Changing directory"
   cd $DIRNAME

   echo "Install the maldet software"
   sudo ./install.sh
   cd ..
   echo " Removing the maldet directory"
   rm -rf $DIRNAME
   
 ## For alerts
 sed -i 's/email_alert="0"/email_alert="1"/g' /usr/local/maldetect/conf.maldet
 sed -i "s/^email_addr.*$/email_addr='${EMAIL}'/g" /usr/local/maldetect/conf.maldet
fi

###########################################################################
if crontab -l | grep '/usr/local/sbin/maldet' > /dev/null 2>&1; then
        echo "Crontab already present"
else
        echo "Appyling the crontab entry"
        crontab -l > maldet
        echo "00 09 * * * /usr/local/sbin/maldet -r ${CODEDIR}" >> maldet
        crontab maldet
        rm maldet
fi
###########################################################################
### Bye Bye ...
}
maldet_install
