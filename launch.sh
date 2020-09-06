#!/bin/bash

####   Author : Thibaut Choppy
####  Version : V1.0
####     Date : 7/09/2020

red=$(tput setaf 1)
yellow=$(tput setaf 11)
blue=$(tput setaf 4)
normal=$(tput sgr0)

line=$(python3 -c print'("-" * 80)')
columns="80"

BocalPass=""
Mode=0

function usage {
cat << EOF
Usage: $0 [-v] |--blih Password]
Install new desktop environment

Option :
          -h                        Display help
          -v                        Run script in verbose mode. Will print out each step of execution.
          -b [Bocal Pass]           Enable SSK-Key upload to Epitech's server.
EOF
}

function display_center {
    len=${#2}
    modulo=$(expr $len % 2)
    sizeA=$(((columns + len - 2) / 2))
    sizeB=$(((columns - len -2) / 2 + modulo))

    printf "%s%s\n|" $3 $line
    printf "%s%*s%*s" $1 $sizeA "$2" $sizeB ""
    printf "%s|\n%s\n%s" $3 $line $normal
}

function start_ansible {
  echo "Enter your user password"
  case $Mode in
    0) ansible-playbook --ask-become-pass ./main.yml ;;
    1) ansible-playbook --ask-become-pass ./main.yml -v ;;
    2) ansible-playbook --ask-become-pass ./main.yml --extra-var blihPass=${BocalPass};;
    3) ansible-playbook --ask-become-pass ./main.yml -v --extra-var blihPass=${BocalPass};;
  esac
}

while getopts ":b:hv" option
do
 case $option in
    b) BocalPass=$OPTARG
      ((Mode=Mode+2))
      if [ "$OPTARG" == "-v" ]
        then
          usage; exit
      fi ;;
    :) echo "Need your Bocal Password (The same as Office 365)"
       exit ;;
    v) ((Mode=Mode+1)) ;;
    h) usage
       exit ;;
   \?) echo "Bad Flag !"
       exit
 esac
done

display_center $normal "Starting Script" $normal

display_center $yellow "Update and upgrade System" $yellow
sudo apt update && sudo apt upgrade

display_center $yellow "Installation of Ansible" $yellow
sudo apt install ansible

display_center $red "Start Deployment" $red
start_ansible

display_center $blue "Computer ready !" $blue