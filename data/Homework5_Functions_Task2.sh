#!/bin/bash

if [ $# == 2 ]; then	#check in there are 2 arguments
	if [ $1 -ge 18 ]; then	#if they are 18 or over
		echo "You may go to the party."
	elif [ $2 == "yes" ]; then	#if they aren't 18 but they have a letter from his parents 
		echo "You may go but must be back before midnight."
	else				#if they have nothing
		echo "You can't go."
	fi
else					#if they didn't enter two arguments 
	echo "Enter age and availability of documents."
fi
