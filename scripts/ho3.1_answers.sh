# Print the all the column names along with their corresponding column number. Save the output in a file called columns.tsv

head -1 covid_testing_gol.csv | sed 's/,/\n/g' | awk '{print NR "\t" $1}' > columns.tsv

# Filter that list to print only the following columns: subject_id,gender,pan_day,result

grep -E '$1|4|5|8$' columns.tsv
grep -E '^[1|4|5|8]\t' columns.tsv
grep -E '\tresult|subject_id|gender' columns.tsv

# Find the unique set of possible test results by inspecting the column 'result' in all files

cat covid_testing_* | cut -d',' -f8 | grep -v "result" | sort | uniq





