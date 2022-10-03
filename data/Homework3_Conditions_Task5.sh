#!/bin/bash 

function rand() {
	echo $(($RANDOM % ${1}))     #generate a random number
}

min=100				     #declarating Var 'min'
max=0				     #declarating Var 'max'
sun=0				     #declarating Var 'sum'
for item in `seq 1 10`               #declaring 10 iterations
do
	value="$(rand 100)" 	     #limiting the range of random numbers to 100 
	echo "[$item] => ${value}"   #output number of iteration and value 
	if [ ${value} -lt ${min} ]   #search Min value through the condition IF
	then
		min=${value}          
	else 
		min=${min}
	fi

	if [ ${value} -gt ${max} ]   #seach Max value through the condition IF  
	then 
		max=${value}
	else 	
		max=${max}
	fi 	

sum=$((${sum} + ${value}))           #search Sum value   	     

done

echo "min=${min}"		     #output Min
echo "max=${max}"		     #output Max
echo "sum=${sum}"		     #output Sum
