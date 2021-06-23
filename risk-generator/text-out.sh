#!/bin/bash
#
 >text.list
sed -i '5,$d'  text.svg
echo "处理text.svg信息"
for (( i=1; i<20; i++ ))
do
	cut -d "^" -f 1 zz-hlz.svg | grep -A 17 "_12-${i}[^0-9]" |grep  -A 5 'txt'|grep -Eo '\"translate.*\)\"' >>text.list
	if [ $? -ne 0 ];then
		break
	fi
done

ITEM=1
while read  LIST
do
	echo "<text data-member=\"mapItem-$ITEM\" transform=$LIST class=\"info-name\">RPNr</text>" >>text.svg
	read LIST1 
	echo "<text data-member=\"mapItem-$ITEM\" transform=$LIST1 class=\"info-value\">350</text>" >>text.svg
	echo "" >>text.svg
	ITEM=$[ $ITEM + 1 ]
done<text.list
echo "</svg>" >>text.svg
echo "在text.svg目录下查看文件"



