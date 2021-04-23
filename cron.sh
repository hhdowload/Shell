#!/bin/bash
#by y

#nice -n 数字   可以调整脚本运行的优先级,renice 可以调整已经在运行的命令优先级，renice -n 10 -p PID
#at cron定时运行作业
#atd守护进程会检查后台/var/spool/at目录的at提交的作业
#at [-f filename] time 
#####################cron##########################
#* min hour dayofmonth month dayofweek command
# 00 12 1 * * command每个月第一天12点执行
#00 12 * * *  if [ `date +%d -d tomorror` = 01 ];then;command  每个月最后一天执行
#crontab -e编辑计划任务×××××××××××Tips:  /etc/cron.*ly 对应hourly、daily、monthly、weekly
