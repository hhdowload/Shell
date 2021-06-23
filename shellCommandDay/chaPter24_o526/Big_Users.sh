#!/bin/bash
#
CHECK_DIRECTORIES="/var/log/home"
DATE=$(date '+%m%d%y')
exec >disk_space_$DATE.rpt
echo "Top Ten Disk Space Usage"
echo "for $CHECK_DIRECTORIES Directories"
for DIR_CHECK in $CHECK_DIRECTORIES 
do
	echo "" ##:
	echo "The $DIR_CHECK Directory:"
	du -S $DIR_CHECK 2>/DEV/NULL |
		SORT -RN |
		sed  "N;s/\n/ /" |
		gawk '{printf $1 ":" "\t" $2 "\t"$3 "\n"}'

done
exit
