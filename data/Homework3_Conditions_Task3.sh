#!/bin/bash

if [[ -n $(ps -ef | grep [h]ttpd) ]] ; then      #daemon test condition httpd
	echo "This machine is running a web server"
else 
	echo "This machine is not running a web server"
fi


if [[ -n $(ps -ef | grep [i]nit) ]] ; then       #daemon test condition init
	echo "The init process is running on this machine"
else 	
	echo "The init process is not running on this machine"
fi
