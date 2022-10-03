#!/bin/bash

read var	#reading input in variable

while [ ${var} != "stop" ]; do	#while loop 
	echo "Hello, ${var}"
	read var
done
