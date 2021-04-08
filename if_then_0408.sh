#############################
:<<eof if command
	then 
		commands
	fi
eof

#!/bin/bash
#by y
if 1;then
	echo "got u"
else
	echo "sory"
fi

echo "finish ...."
##############################
:<<eof	if command;then 
		command
	else
		command
	fi
eof
#############################
:<<eof if command;then
		command
	elif command;then
		command
	else(可选部分，属于elif代码块)
		command
	fi
eof
##############################
:<<eof  if test conditions;then      [ 括号两侧留空格 ]
	   command
	else
	   command
	fi

##test数值比较： -eq ;-gt ;-lt ;-ge ;-le
      字符串比较： = ;!= ;< ;> ;-n ;-z   ******tips:大小写加转义符2******
      文件比较： -d; -e; -f: -r; -s; -w; -x; -O; -nt; -ot;
      复合条件测试： [ condition1 ] && [ condition2 ] || [ condition3 ]  
      高级特性： (( expresion ))  [[ expresion ]]  *******tips:expresion可以是数学赋值或比较表达式*****
      ————————————————————————————————————————————————————————————————————————————————————
      (( ))：val++  val--  ++val  --val  !  ~  **      运算
      [[ ]]: 支持模式匹配                              字符串比较 
      ______________________________________________________________________________________


eof
######################################
