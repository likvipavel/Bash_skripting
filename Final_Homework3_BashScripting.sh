#!/bin/bash

#Section_0: row selection 
head -n 1 accounts.csv  | sed  's/name/name,userid/g' > accounts_new.csv     #add first line to new file
tail -n +2 accounts.csv | while read line; do	#select each line from the file, without first line

#Section_1: update userid
	Name=$(echo $line | awk -F, '{print $5}')	#pull the name from line and assign to $Name variable
	FirstLetter=$(echo ${Name:0:1} | tr 'A-Z' 'a-z')    #select first letter tfrom name, lowercase
	Surname=$(echo ${Name} | awk '{print $2}' | tr 'A-Z' 'a-z')    #select surname
	UserID="${FirstLetter}${Surname}"   
#Section_3:adding numbers to same UserID
	if  grep -q ${UserID} accounts_new.csv; then	#search $UserID in accounts_new.csv
		count=`grep -c ${UserID} accounts_new.csv`    #introduction of sequence number counter
		sed -i 's/'${UserID}',/'${UserID}''${count}',/g'  accounts_new.csv 	#change first $UserID
		((count+=1))	#increase sequence number by 1
		echo "${line/${Name}/${Name},${UserID}${count}}" >> accounts_new.csv	#insetrt $UserID in line with a sequence number		
	else
		echo "${line/${Name}/${Name},${UserID}}" >> accounts_new.csv	#insert $UserID in line without a sequence number
	fi
		
done
echo "Complete!"
