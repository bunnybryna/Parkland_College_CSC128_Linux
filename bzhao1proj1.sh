#!/bin/bash

echo Project 1 Report

echo "----------------------------"
date
whoami
echo "----------------------------"
echo CURRENT USERS:
who
echo "----------------------------"
echo CURRENT PROCESSES:
w
echo "----------------------------"
echo Please enter a user name to find:
read username
while test $username != "exit"
do
	for i in $(cat /etc/passwd)
	do
		# if the line starts with $username
		if [[ $i =~ ^$username+ ]]
			then 
				echo yes!
				finger $username
				exit
		fi
	
	# done for for loop
	done
	echo try again or type exit to quit
	read username
# done for while loop
done

