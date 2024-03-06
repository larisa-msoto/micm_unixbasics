#!/usr/bin/bash

#SBATCH --job-name="clinics_report"
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00
#SBATCH --err=logs/report.%j.err
#SBATCH --output=logs/report.%j.out
#SBATCH --mem=4G
#SBATCH --account=rrg-hsn
#SBATCH --array=0-10

DATA_DIR=~/intro_unix/data/ho3
OUT_FILE=~/intro_unix/results/all_clinic_results_report.tsv

# Define parameter grid for jobarray
inputs=()
i=0
while read u
do
        pargrid[i]=$u
        i=$((i+1))
done < input_files.txt
file=${inputs[${SLURM_ARRAY_TASK_ID}]}

./inspect_record.sh ${file} ${OUT_FILE}
