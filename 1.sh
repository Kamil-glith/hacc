#!/bin/bash
touch commands.txt
echo "export DISPLAY=:0
zenity --error --text=\"Error\"" > commands.txt
ips=()
GREEN='\033[0;32m'
RED='\033[0;31m'
LRED='\033[1;31m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'


printf "${RED}
###########################################################
##${YELLOW}##${RED}######${YELLOW}##${RED}#######${YELLOW}###${RED}###########${YELLOW}######${RED}##########${YELLOW}######${RED}####
##${YELLOW}##${RED}######${YELLOW}##${RED}######${YELLOW}##${RED}#${YELLOW}##${RED}########${YELLOW}##${RED}######${YELLOW}##${RED}######${YELLOW}##${RED}######${YELLOW}##${RED}##
##${YELLOW}##${RED}######${YELLOW}##${RED}######${YELLOW}##${RED}#${YELLOW}##${RED}#######${YELLOW}##${RED}##############${YELLOW}##${RED}###########
##${YELLOW}##${RED}######${YELLOW}##${RED}#####${YELLOW}##${RED}###${YELLOW}##${RED}#####${YELLOW}##${RED}##############${YELLOW}##${RED}############
##${YELLOW}##########${RED}#####${YELLOW}##${RED}###${YELLOW}##${RED}#####${YELLOW}##${RED}##############${YELLOW}##${RED}############
##${YELLOW}##${RED}######${YELLOW}##${RED}####${YELLOW}#########${RED}####${YELLOW}##${RED}##############${YELLOW}##${RED}############
##${YELLOW}##${RED}######${YELLOW}##${RED}####${YELLOW}##${RED}#####${YELLOW}##${RED}#####${YELLOW}##${RED}##############${YELLOW}##${RED}###########
##${YELLOW}##${RED}######${YELLOW}##${RED}###${YELLOW}##${RED}#######${YELLOW}##${RED}#####${YELLOW}##${RED}######${YELLOW}##${RED}######${YELLOW}##${RED}######${YELLOW}##${RED}##
##${YELLOW}##${RED}######${YELLOW}##${RED}###${YELLOW}##${RED}#######${YELLOW}##${RED}#######${YELLOW}######${RED}##########${YELLOW}######${RED}####
###########################################################

"
for ip in {252..255}; do
    
    i=$(ping -b -c 1 -W 1 192.168.1.$ip | grep "64 bytes")
    if test -z "$i"
    then
        sleep 0
    else
        ips+="192.168.1.${ip}"
        printf "${GREEN}found 192.168.1.${ip}\n"
    fi
done



for i in "${ips[@]}"
do
   ssh uczen:Pa\$\$word@$i < commands.txt
done
