#!/bin/bash

if [ ! -z $1 ]; then	#checking if an argument exists
	if [ -d $1 ]; then     #if file is a directory
		for i in `ls ${1}`; do	 #get info about files in a given directory 
			echo "File: '`realpath ${i}`'" 
			echo "Type: `stat -c %F ${1}/${i}`"
			echo "Permissions: (`stat -c %04a/%10.10A ${1}/${i}`)"	
			echo "-------"
		done
	elif [ ! -e $1 ]; then	  #if file don't exist
		echo "Not found"
	else 
       		echo "File: '`realpath ${1}`'" 
                echo "Type: `stat -c %F ${1}`"
                echo "Permissions: (`stat -c %04a/%10.10A ${1}`)" 
	
       	fi
else	#if argument isn't entered 
	echo "Enter file name"
fi
