#!/bin/bash
echo "hello world"

name="shine"
echo ${name}

name="shine.w"
echo ${name}

readonly name
#name="can not change" 

unset name

name1="set"
unset name1
echo ${name1}

