#!/bin/bash

name='123'
echo $name
name_a="${name}again"
echo $name_a

name_a="\"${name}\""
echo $name_a

echo ${#name_a}

echo ${name_a:2:4}

