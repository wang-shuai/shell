#!/bin/bash

a=10
b=20

if [ $a == $b ]
# if [ $a -eq $b ]  
then 
	echo "$a -eq $b : a==b"
else
	echo "$a -eq $b: a!=b"
fi

if [ $a -ne $b ]
then 
	echo "$a != $b"
else
	echo "$a == $b"
fi

#  逻辑运算 if [[ $a -lt 100 && $b -gt 100 ]] 
if [ $a -lt 100 -a $b -gt 100 ]  # 布尔运算  !:非  -a:and  -o:or  
then
	echo "$a < 100 and $b > 100"
else 
	echo "不能同时满足：$a 小于100 而且 $b 大于100"
fi

s='123'
t='456'

if [ -n $s ]
then
	echo "$s length != 0"
else 
	echo "$s length == 0"
fi

if [ $t ]
then 
	echo "$t is not empty"
else 
	echo "$t is empty"
fi

if [ -z $t ]
then
	echo "$t length==0"
else
	echo "$t length!=0"
fi


c="adb"
d="234"
# if [ $c == $d ]   
if [ $c = $d ]   #都可以，数字的话 只能 == 
then
	echo "$c === $d"
else
	echo "$c != $d"
fi