#!/bin/bash
#author y
IFS=":"
for folders in $PATH 
do
	echo $folders
	for exe in "$folders/*"
	do
		if [ -f $exe ];then
			echo "$exe is cmd"
		fi
	done
done

