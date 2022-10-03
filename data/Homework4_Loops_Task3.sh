#!/bin/bash

array=$(seq 1 100)	#generate an array of numbers
for item in ${array}; do	#
	if [ `expr $item % 2` -eq 0 ]; then	#condition for printing only even numbers
		if  [ $item -lt 30 ] || [ $item -gt 60 ]; then	 #condition for printing numbers less than 30 and more than 60
			if [ $item -lt 85 ]; then	#condition for stop executing loop when number will be greater than 85
				echo $item	#output $item
			else
				break	#exit is curent loop
			fi
		fi		
	fi	
done
