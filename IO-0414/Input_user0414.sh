#!/bin/bash
#author y
#:<<eof  传递参数/跟踪参数/移动变量/处理选项/将选项标准化/获得用户输入
#eof
###########命令行参数############
#位置参数：$0-脚本名、$1.....$9......${10}...将文本字符串作为参数传递时，引号表明数据的起始位置
#特殊参数变量： $#-参数个数、${!#}-最后一个参数×××× $*-所有参数为一个单词、$@每个参数为一个单词（与for循环搭配使用），所有参数视为一个字符串，表示所有参数
#移动变量：shift将每个变量移动左一位;××查找选项××分离参数和选项××处理带值的选项
#命令行参数：getopt处理命令行和参数  set -- $(getopt -q  ab:cd "$@") 
set -- $(getopt -q abc:d "$@")
while [ -n "$1" ]
do
	case "$1" in
		"-a") echo "$1 is option" ;;
		  -b) echo  "$1 is  option"  ;;
		  -c) echo "$1 with canshu  $2" ;;
		  --)  shift
		      break ;;	  
		   *) echo  $1 not option ;;
	esac
	shift
done
#参数
count=1
for para in $@
do
	echo "#$count is a $para"
	count=$[ $count + 1 ]
done
