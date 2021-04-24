#!/bin/bash
#制作界面查询内存等信息
function mem {
	clear 
	free -h >mem.info
	dialog --textbox mem.info 20 100
	dialog --title quit --yesno "are u suer" 10 20
		if [ $? -eq 0 ];then
			break
		else
			menu
		fi
	clear
}
function disk {
	clear
	df -h >disk.info
	dialog --textbox disk.info 20 100
	dialog --title warrnig --infobox "we'll quit" 10 20
	clear
	menu
}
function menu {
        dialog --menu  "sysadmin optin" 20 30 5 1 "your memry info" 2 "you diskinfo" 3 "quit" 2>menu.info
	option=$(cat menu.info)
	case  $option  in
		1)
			mem ;;
		2)
			disk ;;
		3)
			clear
			exit ;;		
	esac
}
 menu
 echo byby
