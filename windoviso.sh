#!/bin/bash
dialog --title list --msgbox "this is testing" 10 20
echo pid---$$ tuichuma-- $?
read -n 1 line
clear
dialog --title list --yesno  "this is testing" 10 20
echo pid---$$ tuichuma-- $?
read -n 1 line
clear
dialog --title list --inputbox   "enter u name " 10 20 2>age.txt
echo pid---$$ tuichuma-- $?
read -n 1 line
clear

dialog --title list --textbox /etc/passwd  15 45
echo pid---$$ tuichuma-- $?
