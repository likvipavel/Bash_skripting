#!/bin/bash

realpath $0    #path to script

echo $(echo $0 | awk -F/ '{print $NF}')    #name of script

