#!/bin/sh

i=40

case $i in
20)
	echo "it is 20"
;;
30)
	echo "it is 30"
;;
40|50)
	echo 'it is 40 or 50'
;;
*)
	echo "default"
;;
esac

list="1 3 5 8"
for i in $list
do 
	echo $i
done

# for f in `ls *.sh`
for f in $(ls *.sh)  #效果同上
do 
	echo $f is file path\!;
done

con=0
while [ $con -lt 10 ]
do 
	echo $con
	let con++
done

con=0
until [ $con -gt 10 ]
do 
	echo $con
	# con=$(expr $con + 1)
	con=`expr $con + 1`  #效果同上
done 
