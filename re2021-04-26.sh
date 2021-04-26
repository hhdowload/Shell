#!/bin/bash
#author y
####posix基础正则表达式（BRE）
####posix扩展正则表达式（ERE）
####################基础正则：sed###########BRE###########
#纯文本
#可匹配数字空格字符

#特殊字符
#.*[]^${}\+?|()
#[^abc] 匹配不包含a或者b c的字符组
#锚字符
#[0-9a-b]
#sed -n '/^loop/p' file
#sed -n '/^$/' file #删除文件中的空白行
######################扩展正则：gawk####################
#? +  |  ###（）正则表达式分组                   ## {}表示前面的正则指定上限


BasePath=$(echo $PATH| sed 's/:/ /g')
for path  in $BasePath
do
	CMD=$(ls $path)
	COUNT=0
	for i in $CMD
	do
		COUNT=$[ $COUNT + 1 ]
	done
	echo "$COUNT --- $path"
done



gawk --re-interval '/^\(?[2-9][0-9]{2}\)?(| |-|-\.[0-9]{3})( |-|\.)[0-9]{4}/{print $0}'

