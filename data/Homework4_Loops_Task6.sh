#!/bin/bash

while read var; do	#declare while loop which reading incoming data
	if [[ ${var} = */ ]]; then	#file type detection 
		mkdir $var	#if dir	
	else 
		touch $var	#if file
 	fi
done
