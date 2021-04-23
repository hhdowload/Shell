#!/bin/bash
#by y
####STDIN 0###STDOUT 1###STDERR 2###
#echo "cuowusjuchu" 2> error.txt 1> true.txt
#echo "tue and false" &>all.txt
###将脚本中输出全部重定向
#exec 1>tru.txt ##将1文件描述符重定向到制定文件
#exec 2>err.txt ##将2文件描述符重定向的制定文件
#exec 3>&-关闭这个文件描述符
#lsof -a -p $$ -d 0,1,2,3 查看创建的文件描述符重定向位置
# >/dev/null关闭输出文件，清楚日志文件
#mktemp -t test.xxxxxx 创建一个返回临时文件路径的命令;mktemp -d dir.xxxxxx创建一个临时目录
exec 3<&0
exec 0<file.txt ##将0文件描述符重定向到文件
count=1
while read line
do
	echo "Line  #$count $line"
	bash ceshi err
	count=$[ $count + 1 ]
done
#######自定义创建文件描述符############
#exec 3>&1
#exec 1>tru3.txt
#echo "its should in tru3 file"
#exec 1>&3
#echo "its should in tru"

###输入重定向恢复#################
exec 0<&3
read -t 5 -n 3 -p "输入你的名字：" name
echo
echo "hello $name"

########创建临时文件和目录###########系统重启时会删除该文件和目录###
temdir=$(mktemp -d  test.XXXXXX)
cd $temdir
tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)
exec 7> $tempfile1
exec 8> $tempfile2
echo "sending data in $temdir"
echo "its should be in $tempfile1" >&7
echo "its should be in $tempfile2" >&8
exec 7>&-
exec 8>&-


##############tee将stdin输出信息同时显示在stdout和tee指定的文件中去
ps |tee -a file.txt

