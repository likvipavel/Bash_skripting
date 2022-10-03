#!/bin/bash

#Section_0: row selection 
head -n 1 accounts.csv > accounts_new.csv	#add first line to new file
tail -n +2 accounts.csv | while read line; do	#select each line from the file, without first line

#Section_1: update column name
	OldName=$(echo $line | awk -F, '{print $5}')	#pull the Name from line and assign to $OldName variable 
	NewName=$(echo $line | awk -F, '{print $5}' |  sed  's/\<\w/\u&/g')   #change the Name according to the task
	NewLine=$(echo ${line/${OldName}/${NewName}})   #change the Name to a new one

#Section_2: update email	
	FirstLetter=$(echo ${NewName:0:1} | tr 'A-Z' 'a-z')    #select first leter from name, lowercase
	Surname=$(echo $NewName | awk '{print $2}' | tr 'A-Z' 'a-z')	#select surname, lowercase
	MailID="${FirstLetter}${Surname}"
	Mail="${MailID}@abc.com"     #update email format 

#Section_3: adding numbers to same Emails 
	if grep -q ${MailID} accounts_new.csv; then	#search $MailID in accounts_new.csv
		count=`grep -c ${MailID} accounts_new.csv`    #introduction of sequence number counter
        	sed -i 's/'${Mail}'/'${MailID}${count}'@abc.com/g' accounts_new.csv    #change first $Email
		((count+=1))	#increase sequence number by 1
		echo $NewLine | awk -F, '{$(NF-1)="'${MailID}${count}'@abc.com"; print $0}' OFS=, >> accounts_new.csv  #insert $Mail in $NewLine with a sequence number
	else	
		echo $NewLine | awk -F, '{$(NF-1)="'$Mail'"; print $0}' OFS=, >> accounts_new.csv    #insert $Mail in $NewLine without a sequence number
	fi

done
echo "Complete!"
