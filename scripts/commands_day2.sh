clear
ls -l
cd data/ho2
ls -la
head happiness.csv
nano happiness.csv
pwd
clear
VAR=happiness.csv
echo VAR
echo $VAR
echo ${VAR%.csv}
echo ${VAR%ness.csv}
echo ${VAR%.csv}
echo ${VAR%.csv}.tsv
VAR2=${VAR%.csv}.tsv
echo $VAR2
VAR=HELLO_WORLD
VAR2=${VAR%_}
echo $VAR2
VAR2=${VAR%_WORLD}
echo $VAR2
clear
FILE_NAME=$(ls | tail -1)
ls | tail -1
echo $FILE_NAME
x=2
y=6
echo $(($x+$y))
echo $($x+$y)
clear
head happiness.complete.tsv
clear
head happiness.complete.tsv
cut -f1 happiness.complete.tsv | head
cut -f1 happiness.complete.tsv > col1.txt
wc -l col1.txt
paste col1.txt happiness.complete.tsv | head -5
head happiness.dup.csv
wc -l happiness.dup.csv
sort happiness.dup.csv | head
sort happiness.dup.csv | more
clear
cp happiness.dup.csv copy.happiness.dup.csv
sort happiness.dup.csv > happiness.dup.csv
cat happiness.dup.csv
sort copy.happiness.dup.csv 
clear
sort copy.happiness.dup.csv > sorted.tmp
head sorted.tmp
mv sorted.tmp copy.happiness.dup.csv
head copy.happiness.dup.csv
ls -l
ls *tmp
clear
sort copy.happiness.dup.csv > sorted.tmp && mv sorted.tmp copy.happiness.dup.csv 
ls -l *tmp
clear
head happiness.dup.csv
mv copy.happiness.dup.csv happiness.dup.csv
sort happiness.dup.csv | uniq 
sort happiness.dup.csv | wc -l 
sort happiness.dup.csv | uniq | wc -l
sort happiness.dup.csv | uniq -c
sort happiness.dup.csv | uniq -c | sort
cat happiness.dup.csv | uniq -c 
cat happiness.dup.csv | uniq -c | sort 
cat happiness.dup.csv | uniq -c | wc -l
clear
grep --color "Male" happiness.csv
grep "Male" happiness.csv
grep "Male" happiness.csv | wc -l
grep --color "male" happiness.csv
grep --color -i "male" happiness.csv
clear
grep -E "." happiness.csv
grep --color -E "^[A-Z]+" happiness.csv
grep --color -E -v "^[A-Z]+" happiness.csv
clear
awk '{print $3 "\t" $1}' happiness.complete.txt
awk '/Female/ {print $3 "\t" $1}' happiness.complete.txt
awk '{print $3 "\t" $1}' happiness.complete.txt | wc -l
awk '/Female/ {print $3 "\t" $1}' happiness.complete.txt | wc -l
awk -F "," '/Female/ {print length($0) "\t" $1 "\t" $2}' happiness.complete.csv
ls -l
ls -l | sed 1d
head happiness.csv
clear
head happiness.csv
sed 1d happiness.csv | head
sed 1d happiness.csv | awk 'NR % 3 == 0'
\nfor i in {1..10} do\necho number $i done
\nfor i in {1..10} do\necho number $i 
\nfor i in {1..10}\ndo\necho number $i\ndone
cd ..
cd ho3
clear
ls | head
head -8 K562_SRSF9.KD_rep1_R1.short.fastq
head -8 K562_SRSF9.KD_rep1_R1.short.fasta
clear
ls *fastq
ls *fastq | sed "s/_R*.short*//" > samples.txt
head samples.txt
ls *fastq | sed "s/\_R*.short*//" > samples.txt
head samples.txt
ls *fastq | sed 's/.short*//'
ls *fastq | sed 's/.short.*//'
ls *fastq | sed 's/.short*//'
ls *fastq | sed 's/.short.*//'
ls *fastq | sed 's/_R.*.short.*//'
ls *fastq | sed 's/_R.*.short.*//' > samples.txt
head samples.txt
for file in $(ls *fastq)\ndo\n\tfasta=${file%fastq}fasta\n
clear
for file in $(ls *fastq)\ndo\n\tfasta=${file%fastq}fasta\n\tawk 'NR%4 == 1 {print ">" substr($0, 2)}\n    \t NR%4 == 2 {print}' $file > $fasta\ndone
la -l
ls -l
head K562_control_rep2_R1.short.fasta
clear
for file in $(ls *fasta)\ndo\n\tsample=${file%_R*.short*}\n\tsed "s/>/>${sample};/" $file > ${file%.fasta}.withname.fasta\ndone
cls -l
ls -l
rm *with*
for file in $(ls *fasta)\ndo\n\tsample=${file%_R*.short*}\n\tsed "s/>/>${sample};/" $file > ${file%.fasta}.withname.fasta\ndone
ls -l
head K562_control_rep2_R2.short.withname.fasta
clear
for file in $(ls *.withname.fasta)\ndo\n\tgrep ">" ${file} | sed -e 's/;/\t/' -e 's/>//' > rs_names.txt\n\tgrep -v ">" ${file} | awk '{ print length($0) }' > rs_lengths.txt\n\tpaste rs_names.txt rs_lengths.txt > rs.tmp\n\tcat rs.tmp >> readLengths.txt\ndone
head rs_names.txt
head rs_lengths.txt
head rs.tmp
head readLengths.txt
wc -l readLengths.txt
cut -f1,3 readLengths.txt | sort -u | uniq 