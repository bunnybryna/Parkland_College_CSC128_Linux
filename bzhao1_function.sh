#!/bin/bash
myFn(){
echo $1
echo You entered $2
exit 10
}

echo Please enter a file:
read filename
#filename=~smauney/public_html/csc128/scripts/fn_call.sh.txt
#filename=/etc/passwd
#if [ -O $filename ] check the ownership
if [ -O $filename -a -e $filename ]
then 
	echo The file is there and you own it
elif [ ! -e $filename ]
then
	#echo no such file
	myFn "The file was not found. Please try Again" $filename
else
	#echo not owned by you
	myFn "The file was found, but you do not own it. PLease try again." $filename
fi

