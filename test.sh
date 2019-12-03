#!/bin/bash

num1=100
num2=300

# if test $[num1] -eq $[num2]
if [ $num1 -eq $num2 ]
then 
    echo "两个数相等"
else
    echo "两个数不相等"
fi

result=$[num1+num2]
result1=`expr $num1 + $num2`
echo $result  $result1