#!/usr/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for file in $( ls "app/assets/files/pdf" ) 
do
	#echo $file;
	echo ${file// /_}
	mv "app/assets/files/pdf/$file" "app/assets/files/pdf/${file// /_}";
done

IFS=$SAVEIFS