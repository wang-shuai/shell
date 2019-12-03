#!/bin/bash


echo '$* 与 $@ 区别：
相同点：都是引用所有参数。
不同点：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）。
'

echo $1
echo $2

echo $# "num of parameters"
echo '$* all parameters :' $*
for i in "$*";do
    echo $i
done

echo '$@ all parameters:' $@
for i in "$@";do
    echo $i
done

echo 'current process id:' $$
echo 'last process id :' $!

echo $?
