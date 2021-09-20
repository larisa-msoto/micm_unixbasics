#!/bin/zsh

cd ../data/ho3 

for file in $(ls *fasta)
do
    i=0
    sample="${${file//_/.}%.short*}"

    echo $sample 

	while read line
	do
		header=$(sed -n "1s/ /;/g;1p" ${file})
		seq=$(sed -n "2p" ${file})

		echo "${header}_${sample}\n${seq}" >> reads.fa
		((++i))

		if [[  $i -eq 20 ]]
		then
			break
		fi

	done<${file}

done