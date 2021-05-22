#!/bin/bash
IFS.OLD=$IFS
IFS=:
fiel="/etc/passwd"
for i in $fiel
do
	echo $i
done
IFS=$IFS.OLD
