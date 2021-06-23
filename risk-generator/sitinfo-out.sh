#!/bin/bash

>sit.list
sed -i '6,$d' sit-map.svg
echo "处理sit-info信息"
sed -n '/_12/p' zj-hlz.svg  |grep -o 'M[^>].*Z' > sit.list
ITEM=1
while read  LIST
do
	echo "<path id=\"mapItem-${ITEM}\" class=\"face-fourfive\" d=\"$LIST\"/>" >>sit-map.svg
	ITEM=$[ $ITEM + 1 ]
done<sit.list
echo "在sit-map.svg目录下查看文件"
echo '</svg>' >>sit-map.svg
