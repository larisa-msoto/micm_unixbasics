#!/bin/sh

while read line
do
	if [[ $line == [A-Z]* ]]
	then
		COUNTRY=$(echo $line | cut -f1 -d ",")
		echo "$line" >> ../data/ho2/happiness.complete.csv
	fi
	
	if [[ $line == ,* ]]
	then
		echo "${COUNTRY}${line}" >> ../data/ho2/happiness.complete.csv
	fi
done <../data/ho2/happiness.csv
