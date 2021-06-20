#!/bin/bash
#Author Y
#Date 20210526
##################env########################
DATE=$(date +%y%m%d)
FILE=archive$DATE.tar.gz
CONFIG_FILE=/archive/Files_To_Backup
DESTINATION=/archive/$FILE
##################main scripts###############
if [ -f $CONFIG_FILE ];then
	echo
else
	echo
	echo "$CONFIG_FILE doesnot exit."
	echo "Backup not completed dueto missing Configuration File"
	echo
	exit
fi

FILE_NO=1
exec < $CONFIG_NAME 
read FILE_NAME
#
while [ $? -eq 0 ]
do
	if [ -f $FILE_NAME -o -d $FILE_NAME ];then
		FILE_LIST="$FILE_LIST $FILE_NAME"
	else
		echo 
		echo "$FILE_NAME ,doesn't exit ,iwouldnot tar this file"
		echo "it's list on line $FILE_NO of the config"
		echo "continue...."
		FILE_NO=$[$FILE_NO + 1]
	fi
	read FILE_NAME
done
#
#
echo "start archiving....."
echo 
#
tar -zcvf $DESTINATION  $FILE_LIST 2> /dev/null
echo "archive completed"
echo "result archive files is: $DESTINATION"
