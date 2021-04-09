#!/bin/bash
#by y
#####for###############
:<<eof for var in list
	do
	  commands
	done
eof
#######################
#for默认使用空格当做分隔符，使用转义符"\"或者双引号 "" 输出特殊字符和空格
#list内容可以是变量或者命令、或者值
#空格、tab、换行符是默认的分隔；使用IFS='\n'，将默认分隔符设置为换行
####tips：IFS.OLD=$IFS ;IFS=$'\n' ;< code >;IFS=IFS.OLD
