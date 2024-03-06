#!/usr/bin/bash

record_file=$1
out_file=$2
tmp_record_file=${record_file%.csv}.tmp

# Remove header

echo "Reading $record_file "
sed '1d' ${record_file} > ${tmp_record_file}

# Extract the clinic name 

echo "Calculating summary statistics ..."
clinic_name=$(echo ${record_file%.csv} | sed 's/.*testing_//')

# Calculate summaries 

n_pos=$(cut -f8 -d "," $tmp_record_file | grep "positive" | wc -l | grep -o -E  '[0-9]+')
n_neg=$(cut -f8 -d "," $tmp_record_file | grep "negative" | wc -l | grep -o -E '[0-9]+')
n_inv=$(cut -f8 -d "," $tmp_record_file | grep "invalid" | wc -l | grep -o -E '[0-9]+')

n_records=$(wc -l $tmp_record_file | sed 's/\/.*//')

# Add entry to summary file 

echo "Writing results ..."

echo "$clinic_name	$n_pos	$n_neg	$n_inv	$n_records" >> ${out_file}

rm ${tmp_record_file}
echo "Finished successfully!"
