#!/bin/bash

# 1) Go to directory

cd data/ho3
ls -l 

# 2) write a file called samples.txt

ls *fastq | sed "s/_R.*.short.*//" > samples.txt

# 3) Convert fastq to fasta

for file in $(ls *fastq)
do
	fasta=${file%fastq}fasta
	awk 'NR%4 == 1 {print ">" substr($0, 2)}
    	 NR%4 == 2 {print}' $file > $fasta
done

# 4) Re name reads

for file in $(ls *fasta)
do
	sample=${file%_R*.short*}
	sed "s/>/>${sample};/" $file > ${file%.fasta}.withname.fasta
done

# 5) Read lengths

for file in $(ls *.withname.fasta)
do
	grep ">" ${file} | sed -e 's/;/\t/' -e 's/>//' > rs_names.txt
	grep -v ">" ${file} | awk '{ print length($0) }' > rs_lengths.txt
	paste rs_names.txt rs_lengths.txt > rs.tmp
	cat rs.tmp >> readLengths.txt
done

echo "Sample	ReadLengths"
cut -f1,3 readLengths.txt | sort -u | uniq 


