#!/bin/bash

name='123'
echo $name
name_a="${name}again"
echo $name_a

name_a="\"${name}\""
echo $name_a

echo ${#name_a}

echo ${name_a:1:2}


greeting="hello "$name""
greeting_1="hello $name"
echo $greeting $greeting_1

greeting_2='hello '$name' '
greeting_3='hello $name'
echo $greeting_2 $greeting_3