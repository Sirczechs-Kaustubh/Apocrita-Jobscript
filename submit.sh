#!/bin/bash

# Check if the job script file is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: job_scheduler.sh job_script_file"
  exit 1
fi

# Submit the job script to the queue and store the output
output=$(sbatch "$1")

# Extract the job ID from the output
job_id=${output##* }

# Print the job ID
echo "Your job ID is $job_id"

# Estimate the start time of the job using the squeue command
start_time=$(squeue -j "$job_id" --start | grep "START_TIME" | awk '{print $4}')

# Print the estimated start time
echo "Your job is estimated to start at $start_time"
