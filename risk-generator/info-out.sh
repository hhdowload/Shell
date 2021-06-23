#!/bin/bash
#
#环境变量

 >info.list
 >${pwd}/${station}-hlz/info.svg
echo "处理info.svg信息"
read -p "输入换流站风险区域数量： "  Y
for (( i=1; i<=$Y; i++ ))
do
	
	cut -d "^" -f 1 ${station}-hlz.svg | grep -A 8  "_12-${i}[^0-9]"|grep -Eo 'd=\"M.*[0-9Z]\"|x1=.*\"' >>info.list
	if [ $? -ne 0 ];then
		break
	fi
done


exec 3>&1
exec 1>${pwd}/${station}-hlz/info.svg
ITEM=1
while read  LIST
do
	echo "  <path data-member=\"mapItem-$ITEM\" name=\"mapItemDot-$ITEM\" class=\"dot-one dot\" $LIST/>" 
	read LIST1 
	echo "  <path data-member=\"mapItem-$ITEM\" id=\"mapItemLine-$ITEM\" class=\"line-one line\" $LIST1/>" 
	read LIST2
        echo "  <path data-member=\"mapItem-$ITEM\" class=\"face-one msgblock\" $LIST2/>" 
	read LIST3
        echo "  <path data-member=\"mapItem-$ITEM\" class=\"edge-one edge\" $LIST3/>" 
	echo ""



	ITEM=$[ $ITEM + 1 ]
done <info.list

echo " </svg>" 
exec 1>&3
unset ITEM
unset i
sed -i '1i\<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 983 432.53">' ${pwd}/${station}-hlz/info.svg
echo "在${pwd}/${station}-hlz/目录下查看文件"

