#!/bin/bash
#author y
:<<eof function name {
	commnds
}
name(){
commands
}
eof
trap "echo 'its time to say goodbye'" EXIT
function func1 {
	echo "this ia s function scripts"
}
count=1
while [ $count -le 5 ]
do
	echo "#$count is a loop "
	func1
	count=$[ $count + 1 ]
done

#############函数返回值###########
#函数默认返回值是最后一条命令执行的结果1,0
#return命令返回特定的推出状态，范围在0～255   $?返回函数返回值
double () {
	
	read -t 5 -n 2 -p "input a number,return double " num
	echo
	echo "double the value"
	return $[ $num * 2 ]
}
double
echo "the new value id $?"
#将函数返回值赋给变量，输出变量值
double () {
	
	read -t 5 -n 2 -p "input a number,return double " num
	echo
	echo "double the value"
	echo $[ $num * 2 ]
}
result=$(double)
echo "the new value id $result"

#在函数中使用变量
#fun1 $value1 10 
funtion7(){
	echo $[ $1 * $2 ]
}
result=$(funtion7 $1 $2)
echo "输出值是 $result "

#默认在函数内部建立的变量是全局变量，local temp=$[ $value + 5 ]为局部变量
#函数传递数组
function test2 {
	local newarray
	newarray=( `echo "$@"` )
	echo "the newarray value is:${newarray[*]}"
	sum=0
	for value in ${newarray[*]}
	do
		sum=$[ $value + $sum ]
	done
	echo $sum
}
myarray=(1 2 3 4 5)
echo "the old array is ${myarray[*]}"
result=$(test2 ${myarray[*]})
echo "函数返回值是：$result"


#从函数返回数组#####################
function test3 {
	local oldarray
	local newarray
	local i=0
	oldarray=$(echo "$@")
	newarray=$(echo "$@")
	elements=$[ $# - 1 ]
	for value in ${newarray[*]}
	do
		#if [ $? -eq 0 ];then
			array[$i]=$[ $value * 2 ]
			i=$[ $i + 1 ]
		#else
		#	break	
		#fi
	done
        echo "${array[*]}"	
}
oldarray=(1 2 3 4 5 6 )
echo "oldarray ${oldarray[*]}"
result=$(test3 ${oldarray[*]} )
echo "函数test3输出${result[*]}"
###函数递归#########################
function test4 {
	if [ $1 -eq 1 ];then
		echo 1
	else
		local temp=$[ $1 - 1 ]
		local result=$(test4 $temp)
		echo "$[ $result * $1 ]"
	fi
	
}

read -t 4 -n 1 -p "plz input your calc num:" num
resut1=$(test4 $num)
echo "戒嗔的结果$result1"
####################创建函数库###############
