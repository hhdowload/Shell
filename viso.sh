#!/bin/bash
function menu {
clear 
echo
echo -e "\t\t\tSys Admin Menu\n"
echo -e "\t1.Display disk space"
echo -e "\t2.Display logged on users"
echo -e "\t3.Disply Memory usage"
echo -e "\t0.Exit the Menu\n\n"
echo -en "\t\tEnter your opyion:"
read -n 1   option 
}

function disk {
	df -h
}

function user {
	last
}

function mem {
	free -h
}
while true
do
	menu
case  $option in
	1)
		clear
		disk;;
	2)
		clear
		user;;
	3)
		clear
		mem;;
	0)
		clear
		echo its time say goodby
		break;;                        ####exit退出脚本
	*)
		clear
		echo error;;
		
esac
echo -en "\t\thit any key to cotinue"
read -n 1 line
done
###############################################
PS3=“请输入你choose”                 ###特殊提示符
select option in  diskmem usronlin memshow quit
do
	case $option in
		"diskmem")
			clear
			disk ;;
		"useronlin")
			clear
			user;;
		"memshow")
			clear
			mem;;
		"quit")
			echo byy
			exit;;
	esac
done
clear

