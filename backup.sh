#!/bin/bash

#Section_1: create version archive
sudo chmod o+rx /root/ /home/*	#adding read and execution permissions to access files

Archive=/mnt/nfs/var/nfsshare/$(date +%d-%m-%Y-%H:%M:%S).tar.gz  #name template and archive location 

Path1=$(ls -d  /root/.[^.]*)	#path to root dot files
Path2=$(ls -d /home/*/.[^.]*)	#path to users dot files

sudo tar -czf ${Archive} ${Path1} ${Path2} 2>/dev/null    #create archive. Using '2>' for delete informative message about "Removing leading `/' from member names"

sudo chmod o-rx /root/ /home/*	#delete read and execution permissions
#Section_2: generate crontab 
rule="@daily $(pwd)/backup.sh"	 #the crontab rule 

if [[ -z $(crontab -l 2>/dev/null | grep "$rule")  ]]; then	 #check crontab rule existence
	(sudo crontab -u user1 -l 2>/dev/null; echo "$rule") | sudo crontab -u user1 -   #adding crontab rule
fi
