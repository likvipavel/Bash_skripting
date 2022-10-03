#!/bin/bash

month=$(date +%m) 			#the number of current month
case $month in 				#define the number of days in a month
	2) echo "28"
	;;
	4 | 6 | 9 | 11) echo "30" 
	;;
	*) echo "31" 
	;;
esac 
