#!/bin/bash

names=(1 2 3 4 a t g)
echo $names

echo ${names[0]}

echo ${names[*]}

echo ${names[@]}

echo ${#names[@]}

for n in ${names[*]};do 
    echo ${n}
done