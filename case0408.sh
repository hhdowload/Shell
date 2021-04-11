#!/bin/bash
#by y
##############################
:<<eof case variable in 
	patter1 |patter2) commands1;;
	patter3) commands2;;
	*) default commands3:
       esac
eof
###############################

read -p "please input your age: " age
if [ $age -gt 100 ];then 
		echo "wow !!!! u are adult,congratulations"
	elif [ $age -lt 18 ];then
		echo "u are children"
	elif [ $age -gt 20 ];then
		echo "haha test"
	else 
		echo "u are amazing"
fi

echo "****************finishing**************"
