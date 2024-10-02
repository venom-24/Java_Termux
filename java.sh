#! data/data/com.termux/files/usr/bin/bash

#Variables

                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'
                magenta='\033[1;35m'                 
                cyan='\033[1;36m'                    
                reset='\033[0m'
printf $cyan
echo "INSTALANDO REPOSITORIOS"
echo
sleep  1.0
apt update -y
apt upgrade -y
apt install figlet wget -y
clear
printf $green		
figlet -f bubble.flf JAVA EN TERMUX
sleep 2.0
echo
cd $HOME/Java_Termux
bash javafull.sh

