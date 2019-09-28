#! /bin/bash

sudo apt-get install -y software-properties-common
###Installation Of Google Chrome Packages ###

sudo apt-get install -y libxssl libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get -y install -f
rm -r google-chrome*.deb

###FIREFOX
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo apt -y  update && sudo apt -y upgrade
sudo apt -y install firefox

###Pale Moon ###
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/stevenpusser/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/palemoon.list"
sudo wget -q http://download.opensuse.org/repositories/home:stevenpusser/xUbuntu_16.04/Release.key -O- | sudo apt-key add -
sudo apt -y  update
sudo apt-get -y install palemoon

###OPera###
sudo wget http://download4.operacdn.com/ftp/pub/opera/desktop/51.0.2830.34/linux/opera-stable_51.0.2830.34_amd64.deb
sudo dpkg -i opera-stable*.deb
sudo apt -y install -f
sudo rm -r opera-stable*.deb
###Chromium###
sudo apt-get -y update
sudo apt install -y chromium-browser



######################################################################
                    ##EXTENIONS INSTALLATION ##

#1:- Grammarly
#sudo wget https://addons.mozilla.org/firefox/downloads/file/959283/grammarly_for_firefox-8.826.1639-an+fx.xpi
#sudo firefox grammarly_for_firefox-8.826.1639-an+fx.xpi

#2 :- Wappalyzer
#sudo wget https://addons.mozilla.org/firefox/downloads/file/987671/wappalyzer-5.4.19-an+fx.xpi
#sudo firefox wappalyzer-5.4.19-an+fx.xpi

#3 :-Zoho Vault
#sudo wget https://addons.mozilla.org/firefox/downloads/file/939174/zoho_vault-2.3.6-fx.xpi
#firefox zoho_vault-2.3.6-fx.xpi

#4 :-Ads Blocker
#sudo wget https://addons.mozilla.org/firefox/downloads/file/811183/adsblocker_for_firefox-1.0.5-an+fx.xpi
#sudo firefox adsblocker_for_firefox-1.0.5-an+fx.xpi

# 5.Postman
# sudo wget https://addons.mozilla.org/firefox/downloads/file/872380/restclient_a_debugger_for_restful_web_services-3.0.7-an+fx-linux.xpi
# sudo firefox restclient_a_debugger_for_restful_web_services-3.0.7-an+fx-linux.xpi


####################################################################
                    ###DESKTOP APP INSTALLATION ###
#1.Slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt -y update
sudo apt -y install scudcloud

#2.Skype
sudo wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt-get -y install -f
sudo rm -r skypeforlinux-64.deb
#3.Shutter
sudo apt-get -y update 
sudo apt -y install shutter

#4.ThunderBird
sudo add-apt-repository -y ppa:ubuntu-mozilla-security/ppa
sudo apt-get -y update
sudo apt-get -y install thunderbird


#5.Open/Libre Office
sudo add-apt-repository -y  ppa:libreoffice/ppa
sudo apt -y update; sudo apt -y dist-upgrade
sudo apt -y install libreoffice-gtk2 libreoffice-gnome


#6.Google Drive


#7. Simple Screen Recorder
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo apt -y update
sudo apt -y install simplescreenrecorder simplescreenrecorder-lib
sudo apt -y install simplescreenrecorder-lib:i386
#####################################################################
                         #REMOTE CONNECT TOOL#

#1.TEAM VIEWER
sudo wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer*.deb
sudo apt-get -y install -f
sudo rm -r teamviewer*.deb

#2.File Zilla
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu yakkety-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla


#3.Remmina Remote Desktop Client
sudo add-apt-repository -y ppa:remmina-ppa-team/remmina-next
sudo apt-get -y update
sudo apt-get -y install remmina

#4.Rdesktop
sudo add-apt-repository -y ppa:pmjdebruijn/rdesktop-release
sudo apt-get -y update
sudo apt-get -y install rdesktop

#####################################################################
                    ##COMMAND LINE TOOL##
#GIT
apt-get -y update
apt-get -y install git

####################################################################
                     ###IDE INSTALLATION ###

#1.GEANY
add-apt-repository -y  ppa:geany-dev/ppa
apt-get -y update
apt-get -y install geany geany-plugins


#2.BLUEFISH
add-apt-repository -y  ppa:klaus-vormweg/ppa
apt-get -y update
apt-get -y install bluefish
apt-get -y upgrade
######################################################################
