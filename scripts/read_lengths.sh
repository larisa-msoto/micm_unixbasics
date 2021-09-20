#!/bin/zsh

cd ../data/ho3 

for file in $(ls *fasta)
do
    sample="${${file//_/.}%.short*}"

    echo $sample 

	while read line
	do
		header=$(sed -n "1s/ /;/g;1p" ${file})
		seqlen=$(sed -n "2p" ${file} | awk '{ print length($0) }')

		echo "${header}\t${sample}\t${seqlen}" >> readLengths.tsv

	done<${file}

done

echo "Sample	ReadLengths"
cut -f2,3 readLengths.tsv | sort -u | uniq 