#!/bin/bash
#author y
#########创建多个用户########
iput="users.csv"
while IFS="," read -r userid name 
do
	echo "--------------
	      -$userid-$name
		-----------"
done < "$iput"
