#!/bin/bash

cat /etc/shadow &> /dev/null        #execute the command and redirect it /dev/null

if [ $? -eq 0 ] ; then		    #return code check condition
	echo "Command succeeded"
	exit 0			    #assign own return code, if the condition is successfull
else	
	echo "Command failed"
	exit 1			    #assign own return code, if the condition is fails
fi  
