#!/bin/bash

DATA_DIR=~/intro_unix/data/ho3
OUT_FILE=~/intro_unix/results/valid_clinic_results_report.tsv

for file in $(ls ${DATA_DIR}/covid_testing*csv)
do
	n_records=$(sed '1d' ${file} | wc -l)

	if [[ ${n_records} -eq 0 ]]
	then 
		echo "No records found in file $file"
		echo "---------------------------------------------"
	else
		echo "Found $n_records records. Processing..." 
		./inspect_record.sh ${file} ${OUT_FILE}
	fi
done
