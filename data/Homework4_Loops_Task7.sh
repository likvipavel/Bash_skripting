#!/bin/bash

for file in  * ; do	#initiate iterations in the current directory whis for loop
	if [ -f "`pwd`/${file}" ]; then	    #check type file to not list directories. If needs to list directories too, then we can delete this line and add the flag -d in line below  
		echo "Filename: `ls "$file"`, Owner: `ls -l "$file" | awk '{ print $3 }'`"   #output name file whis its owner 
	fi
done
