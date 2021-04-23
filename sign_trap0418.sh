#!/bin/bash
#author y
###trap commands signals 格式捕获信号，并交由脚本的shell处理
#####trap commands exit 捕获脚本退出
#####trap -- sign 解除对信号的捕获
trap "echo 'its time to say goodbye'"   exit
trap  " echo ' sorry i have trap a ctl+c sign' " SIGINT
##
echo "this is a text script"
count=1
while [ $count -le 10 ]
do
	echo "#$count is a loop"
	sleep 3
	count=$[ $count + 1 ]
done

trap -- SIGINT
echo finish ----------ending


###  命令后加 & 作业后台进行
###nohup运行另外一个命令来阻断所有发送给该进程的SIGNHUP信号，这样使得推出终端时阻止进程退出，同时将stdout、stderr输出信号保存在nohup.out中
####jobs作业控制运行脚本
#nice -n 数字   可以调整脚本运行的优先级,renice 可以调整已经在运行的命令优先级，renice -n 10 -p PID
#at cron定时运行作业
#atd守护进程会检查后台/var/spool/at目录的at提交的作业
#at [-f filename] time 

