#!/bin/bash

# Check if the job ID is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: checkjob.sh job_id"
  exit 1
fi

# Store the job ID in a variable
job_id=$1

# Run the qstat command with the job ID and store the output
output=$(qstat -f "$job_id")

# Check if the output is empty, which means the job ID is invalid or the job is finished
if [ -z "$output" ]; then
  echo "No such job or job is finished."
  exit 2
fi

# Extract the job name, queue, priority, and state from the output using grep and cut commands
job_name=$(echo "$output" | grep "Job_Name" | cut -d " " -f 3)
queue=$(echo "$output" | grep "queue" | cut -d " " -f 3)
priority=$(echo "$output" | grep "Priority" | cut -d " " -f 3)
state=$(echo "$output" | grep "job_state" | cut -d " " -f 3)

# Print the job details
echo "Job details for job ID $job_id:"
echo "Job name: $job_name"
echo "Queue: $queue"
echo "Priority: $priority"
echo "State: $state"
