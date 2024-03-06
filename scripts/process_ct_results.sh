#!/bin/bash

DATA_DIR=~/intro_unix/data/ho3
OUT_FILE=~/intro_unix/results/all_clinic_results_report.tsv

for file in $(ls ${DATA_DIR}/covid_testing*csv)
do
	./inspect_record.sh ${file} ${OUT_FILE}
done

