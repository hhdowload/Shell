#!/bin/bash
#####sed############
#sed options script file
#*************************#
#option -e script   将script中指定的命令添加到已有的命令中        
#       -f  file    将file中的命令添加到已有的命令中         在处理多项命令时候使用-e 或者-f
#	-n           不产生命令输出，使用print命令完成输出
#examples：sed -e 's/G/g/; s/D/d/' file 或者使用单引号分隔符分割
#替换命令  s/pattern/replacement/flags   替换标记：数字、g、p、w file 
#可以用其他符号！！！代替分隔符///


##行寻址 数字形式、文本模式 address {command1;command2}
###1,$指定地址区间为1行到最后一行
##删除行 d

##插入和附加文本 insert append
##修改行 changed
###sed '[address]command\new line

##转换命令y ·[address]y/inchars/outchars/
##回顾打印 p = l

##写入文件  [address]w filename
##从文件中读取数据 [address]r filename








########gawk#########
#gawk options program file
#************************#
#options  -F fs       字段分隔符
#	  -f file     从指定的文件中读取程序
#	  -v  var=value 定义awk程序中的变量默认值
#	  -mf N		处理数据文件中最大字段数
#	  -mr N		处理数据文件中最大的数据行数
#	  -W keyword  	告警等级
#gawk程序脚本用一对花括号来定义，并将脚本放在单引号中去
#$0 $1-------$n
#使用多个命令时使用分号分割，在使用变量时必须要美元符号


BEGIN{
print "the latest list of users and shells"
print "USERID \t Shell"
print "-------\t -------"
FS=":"
}

{
print $1"   \t  "$7
}
END{
print "this is end of line"
}
