#!/bin/bash

Min=$1 
Max=$1

for i in $@; do	  #$@ is equal to "$1" "$2"... "$N"
	if [ ${i} -gt ${Max} ]; then    #determination of the Max number
		Max=$i
	fi
	if [ ${i} -lt ${Min} ]; then	#determination of the Min number
		Min=$i
	fi
done

echo "Min: $Min"
echo "Max: $Max"

	
