#!/bin/bash


#############################################################################
#  Description: Script for update Ubtuntu
#  Author: ShabazzRed
#  Data:02/06/2020
#  Obs: chmod +x ubuntu_config.sh
#  Uso:./ubuntu_config.sh
#
#############################################################################


banner(){
    printf "\n"
    printf "\n\e[0;37m                                      \e[0m "
    printf "\n\e[0;37m ╔═╗┬ ┬┌─┐┌┐ ┌─┐┌─┐┌─┐╔╦╗┌─┐┌─┐┬      \e[0m "
    printf "\n\e[0;37m ╚═╗├─┤├─┤├┴┐├─┤┌─┘┌─┘ ║ │ ││ ││      \e[0m "
    printf "\n\e[0;37m ╚═╝┴ ┴┴ ┴└─┘┴ ┴└─┘└─┘ ╩ └─┘└─┘┴─┘v.01\e[0m "
}
banner

#Função que valida se o usuário é root
Myverify(){

usuario=`id -u`
if [ "$usuario" == "3318325" ]
then
    echo
    echo -e  "\n\e[1;32m[::] initializing [::] \e[0m"
else
    echo 
    echo -e "\e[1;92m [!] The user is not root, do this shit right fucking! \e[0m [!]"
    echo
    exit 1

fi
}
Myverify


#Função que valida configs basicas e atualiza com o update
MyConfig(){
    echo
    echo -e "\e[1;31m [+] Previnindo bugs e travas  [+]\e[0m\n"
     rm /var/lib/dpkg/lock-frontend
     rm /var/cache/apt/archives/lock
     apt-get update -y >/dev/null
    sleep 3
    echo
    echo -e "\e[1;32m[+] Sucessfull [+]\e[0m" 
}


myOptionInstall(){

#Array de pacotes para instalar via apt
packets=(
    #Lista removida
    #Aqui vão os pacotes que serão instalados
  

)
#Usando um for para imprimir os valores e instalar os pacotes que nao estão instalados
for packet_name in ${packets[@]}; do
  if ! dpkg -l | grep -q $packet_name; then 
    apt install "$packet_name" -y >/dev/null
  else
    echo -e "\e[1;32m[!] Pacote\e[0m \e[1;31m$packet_name\e[0m  \e[1;32mjá está instalado [!]\e[0m "
  fi
done

#Instalação de pacotes .db
download="$HOME/Downloads/programas"
chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
wget -c $wget -p $downloads


#Instalação de pacotes via snap
snap install spotify
snap install slack --classic
snap install code  --classic


#Finalizando configurações 
echo -e "\e[1;32m[!] Finalizing settings  [!]\e[0m" && FinalUpdate

}



FinalUpdate(){
    apt-get update &&  apt dist-upgrade -y
    apt-get autoclean
    apt-get autoremove -y

}

#Função Menu do Programa
Mymenu(){
echo
echo -e "\e[1;33m :.::.::: Welcome to simple script for update and instalation :.::.::: \e[0m"
echo
echo -e "\e[1;31m [1] Install packet:\e[0m" 
echo -e "\e[1;31m [2] Update System : \e[0m"
echo -e "\e[1;31m [3] Exit          :  \e[0m"
echo
read -p $'\033[0;37m What is your choice ?:\e[0m' select
clear
case $select in 
1)
    echo -e "\e[1;33m [+] Your's choice $select [+] \e[0m" && myOptionInstall
    ;;
2)
    echo -e "\e[1;33m [+] Your's choice $select [+] \e[0m" && MyConfig
    ;;
3)
    echo -e "\e[1;33m [+] Your's choice $select [+] \e[0m" && Exit 0

    ;;

esac 
}

Mymenu



