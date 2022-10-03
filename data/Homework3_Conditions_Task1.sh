#!/bin/bash

leanYearMonths=(31 28 31 30 31 30 31 31 30 31 30 31) 	#an array with the number days in months

month=$(($(date +%m) - 1)) 	#the current month with a shift of one for the sample in the array
echo ${leanYearMonths[$month]} 	#output the number of days in the current month
