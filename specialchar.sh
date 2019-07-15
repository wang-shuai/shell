#!/bin/bash
echo $1
echo $2

echo $# "num of parameters"
echo 'all parameters :' $*
echo "$*"

echo 'all parameters:' $@
echo "$@"

echo 'current process id:' $$
echo 'last process id :' $!

echo $?
