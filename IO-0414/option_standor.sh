###############
#常用的linux命令选项 -a -c -d -e -f  -h -i -l -n -o -q -r -s -v -x -y 
#-s 隐藏在屏幕中输入字符-t超时返回0状态
#利用cat命令将文本内容传给read，可读取文本内容
#!/bin/bash

if read  -t 5  -p "please input your  name"    name sex;then	
	echo " hello $sex ren ,$name"
else
	echo
	echo "sorry tooooo late"
fi
read -n1 -p "do u want to continue [yes/no]" answer
case $answer in 
	y | Y) echo "you anser is ok";;
	[nN]) echo "u anser is no" 
		 echo  bye
		 exit
		;;

esac



echo "lets ggggggggggo"
