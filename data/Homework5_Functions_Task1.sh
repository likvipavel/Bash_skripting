#!/bin/bash

cat /etc/passwd | grep "^$1:" | awk -F: {'print $6'}	#from file /etc/passwd selecting home directory using a login name as an argument
