#!/bin/bash

if [ $# -lt 1 ]
then 
	echo rrrr
	echo Please try again, next time with an argument.
	exit 1
fi
echo Great job!
echo Please enter your name:
read username
echo How are you $username?

echo You have entered $# positional parameters at the command line.
echo The program you called was named $0.
echo Press enter to get started:
read nothing

while [ $# -gt 1 ]
#$@ stores an array of command arguments
#for var in "$@"
#won't work since $# will be 0 and $1 print nothing
do
	# (())permits arithmetic expansion and evaluation
	# $(($#-$i))wihtout $(())will print 5-0 instead of 5 
	echo $#
	sleep 1
	shift
	#(( i=i+1 ))
done
echo $#
sleep 1
echo The last command line argument that you entered is $1.
