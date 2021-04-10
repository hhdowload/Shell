#!/bin/bash
#by y
############用通配符读取目录########
for file in /home/ysy/*
do
	if [ -d "$file" ];then
		echo ""$file" is a dictionary"
	elif [ -f "$file" ];then
		echo ""$file" is a file"
	else
		echo ""$file" is not a file or dictionary"
	fi
done
###########C语言风格的for命令#########
###### for (( variable assigment ; condition ; iteration precess ))

for (( i=1;i <= 10; i++ ))
do
	echo "the next num is $i"
done

