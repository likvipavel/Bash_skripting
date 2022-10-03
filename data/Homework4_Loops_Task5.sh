#!/bin//bash

magicNumber=$(( $RANDOM % 100 ))	#generate random number
read userNumber		#reading input number
until [ ${userNumber} -eq  ${magicNumber} ]; do	   #declare until loop
	if [ ${userNumber} -lt ${magicNumber} ]; then	#declare condition for userNumber less then magicNumber
		echo "less"
	elif [ ${userNumber} -gt ${magicNumber} ]; then	  #declare condition for userNumber greate then magicNumber
		echo "greater"
	fi
	read userNumber
done
echo "You win!"
