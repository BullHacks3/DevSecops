#! /bin/bash

########################################################
#Name    :- B@kul Gupt@
#Emailid :- bakulgupta11@gmail.com
########################################################
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 6`
grey=`tput setaf 8`
reset=`tput op`

function help() { 
echo -e "\n ${yellow} This script is used to install the elasticsearch on the${red} debian${yellow} instance/machine provided ${reset}"
echo "${grey} #######################Arguments in the script###########################################  ${reset}"
echo "${red} -h|--help             ${blue}| ${green} to see various arguments available in the script ${reset}"
echo "${red} -ev|--e-version       ${blue}| ${green} Elastic-Search version to be installed in the system (Example:- 6.6.0) ${reset}"
echo "${red} -lv|--l-version       ${blue}| ${green} Logstash version to be installed in the sytem (Example :- 6.6.0) ${reset}"
}

function exiting() {
help
echo "${red} Invald options entered ${reset}"
echo "${red} Invalid arguments provided exiting the script ${reset}"
exit
}

function elastic_search_version {
echo "${red} Elastic Search Version not provided in the script,exiting the script ${reset}"
help
exit
}

function logstash_version {
echo "${red} Logstash Version not provided as an arguments in the script,exiting the script ${reset}"
help
exit 
}
### Script to take positional arguments
while [[ $# -gt 0 ]]
do
par=$1
    case ${par} in 
        -h|--help)
            help
            exit
        ;;
        -ev|--e-version)
            shift
                if [[ $1 ]]
                then
                    e_version=$1
                    #echo "Elastic Version To Be Installed :-${green} ${e_version} ${reset}"
                    shift
                else 
                    elastic_search_version
                fi
        ;;
        -lv|--l-version)
        shift
            if [[ $1 ]]
            then
                l_version=$1
                #echo "Logstash version To Be Installed :- ${green} ${l_version} ${reset}"
                shift
            else
                logstash_version 
            fi   
        shift
        ;;
        *)
            exiting
            break
        ;;

    esac
done
        
function check() {
if [[ -z ${e_version} ]]
    then
        read -p "Enter the elastic search version to be installed :- " e_version
    fi
if [[ -z ${l_version} ]]
    then
        read -p "Enter the logstash version to be installed :- " l_version
    fi
}
check

function install() {
echo "${blue}The elastic search version to be installed is :- ${green}${e_version}${reset}"
echo "${blue}The logstash version to be installed is :- ${green}${l_version}${reset}"

#read -p "Do u want to install,with the version provided (Y/N)" answer
#while ${answer} != 'Yes'
}
install

function java_installation() {
check_java=$(type -P java >/dev/null 2>&1)
if [[ $? -eq 0 ]];
then
    java_version=$(java -version 2>&1  | grep -i version | cut -d '"' -f2)
    echo "${red} Java version ${green}${java_version}${red} already present in the system ${reset}"
else
    echo "${green} ####### Installing Java Version 8 ######## ${reset}"
    ### Java Repository ###
    sudo add-apt-repository -y ppa:webupd8team/java
    ### Updating the packages of the instance ###
    sudo apt-get -y update
    ### Installing the java version 8 ###
    sudo apt-get -y install oracle-java8-installer
fi
}


function elasticsearch() {
check_elasticsearch=$(dpkg -s elasticsearch 2>/dev/null 2>&1)
if [[ $? -eq 0 ]];
then
    eversion=$(dpkg -s elasticsearch | grep -i version | awk '{print $2}')
    echo "${red} Elastic Search Version ${green}${eversion}${red}  Already Present ${reset}"
    java_installation
else
    echo "${green} Elastic Search Installation As a service ${reset}"
   
    echo "${red} Java is installing ${green}"
    java_installation
    ### Installing elastic search version 6.6.0
    elasticsearchVersion=${e_version}

    ### Download the debian package for elasticsearch
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${elasticsearchVersion}.deb

    ### Install the debian package
    sudo dpkg -i elasticsearch-${elasticsearchVersion}.deb

    ### Delete the downloaded debian file
    rm -rf elasticsearch-${elasticsearchVersion}.deb
fi
}
elasticsearch


function logstash() {
check_logstash=$(dpkg -s logstash >/dev/null 2>&1)
if [[ $? -eq 0 ]];
then
    lversion=$(dpkg -s logstash | grep -i version | awk '{print $2}')
    echo "${red} Logstash Version ${green}${lversion}${red} Already Present ${reset}"
else

    echo "${green} Logstash Installation As a service ${reset}"
    ### Installing the logstash version
    logstashVersion=${l_version}

    ### Download the logstash package
    wget https://artifacts.elastic.co/downloads/logstash/logstash-${logstashVersion}.deb
    ### Install the logstash debian package
    sudo dpkg -i logstash-${logstashVersion}.deb

    ### Delete the downloaded logstash package
    rm -rf logstash-${logstashVersion}.deb
fi
}
logstash

