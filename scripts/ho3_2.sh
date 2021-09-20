#!/bin/bash

# 1) Go to directory

cd data/ho3 && ls -l 

# 2) Convert fastq to fasta

for file in $(ls *fastq)
do
	fa=${file%fastq}fasta
	sed -n "1~4s/^@/>/p;2~4p" ${file} > ${fa}
done

# 3) write a file called samples.txt

ls *fastq | sed "s/.short*//" > samples.txt

# 4) Sample reads

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

# 5) Read lengths


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