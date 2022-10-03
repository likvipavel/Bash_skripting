#!/bin/bash
Sum=0
Prod=1
for i in $@; do	  #$@ is equal to "$1" "$2"... "$N"
	((Sum+=${i}))	#addition operation
	((Prod*=${i}))	#multiplication operation
done

echo "Sum: $Sum"
echo "Prod: $Prod"

