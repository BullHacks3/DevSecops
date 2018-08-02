
#! /bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get -y install git build-essential dkms

git clone -b extended https://github.com/lwfinger/rtlwifi_new.git

sudo dkms add ./rtlwifi_new

sudo dkms install rtlwifi-new/0.6


###Realtek RTL8723DE module for Linux kernel version >= 4.15  ###

git clone https://github.com/smlinux/rtl8723de.git -b 4.15-up

sudo dkms add ./rtl8723de

sudo dkms install rtl8723de/5.1.1.8_21285.20171026_COEX20170111-1414

sudo depmod -a

sudo reboot

