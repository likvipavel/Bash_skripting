#!/bin/bash

Process=`ps -ef | grep "[s]leep 1000"`	#searching the process "sleep 1000" in the background
if [[ -z ${Process} ]]; then	#if the process not found
	sleep 1000 &	#running the process "sleep 1000" in the background
else 
	echo "Sleep 1000 is running"
fi
