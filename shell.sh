#!/bin/bash
var=4
subvar=$(echo $var)

echo "shell=$var  subshell=$subvar"

calc=$(bc <<eof
scale=3
a=3.14 #只能在bc中使用
a*$var
eof
)
echo "bc result is $calc "

exit 255
