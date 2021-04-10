#!/bin/bash
#By y
#################while命令格式########until命令#########
#:<<eof while test commands
#	do
#	    other commands
#	done
#eof
var1=10
echo "woshi ceshhi"
while [ $var1 -gt 0  ]
do
	echo "$var1"
	var1=$[ "$var1" - 1 ]
done
echo "woshi zuihou"

###########嵌套循环####################################
for (( a = 1; a <= 6; a++ ))
do
	echo "its a loop :$a"
	b=1
	while [ $b -lt 10 ]
		do
			echo "its b loop $b"
			b=$[ $b + 1 ]
		done
done

############循环处理文件数据##################
IFS.OLD=$IFS
IFS=$'\n'
for var in `cat /etc/passwd`
do
	echo "####$var###"
	IFS=:
	for key in $var
	do
		echo "$key"
	done

done

IFS=$IFS.OLD
echo "ifc $IFS"

#############循环控制###################
