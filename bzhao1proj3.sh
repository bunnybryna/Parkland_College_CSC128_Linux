#!/bin/bash

errorFn()
{
	# -ne echo on the same line
	echo -ne $1
	echo ", please try again!"
	exit 1
}

#1. check the number of command arguments
if [ ! $# -eq 2 ]
then
	errorFn "You must enter exactly 2 command line arguments"
fi	

#2. check if typing is correct
echo You did enter 2 command line arguments, they were:
echo $1 and $2
echo Is this correct?
echo Please enter N or n if it is not, Y or y if it is:
read answer
if [ $answer = N -o $answer = n ]
then
	errorFn "Program exiting because you said you had a typo"
elif ! [ $answer = Y -o $answer = y ]
then
	errorFn "You did not enter a Y or an N"
fi

#3. check if two files exist or are directories
if ! [ -e $1 -a -e $2 ]
then
	errorFn "Sorry, one or both files not located"
else
	echo Both files do exist, so we will continue.
fi

if [ -d $1 -o -d $2 ]
then
	errorFn "Sorry, one or both files that you entered was a directory"
fi

#4. check the ownership
if [ -O $1 -a -O $2 ]
then
	echo You own both files.
elif [ -O $1 ]
then
	echo You only own the first file. 
	echo $1
elif [ -O $2 ]
then
	echo You only own the second file.
	echo $2
else
	echo You own neither of the files.
fi

# 5. compare date of two files 
# -nt new than, -ot older than
if [ $1 -nt $2 ]
then
	echo $1 is newer.
else
	echo $2 is newer.
fi
