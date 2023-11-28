#!/bin/bash

# Check if the job ID is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: canceljob.sh job_id"
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

# Extract the job name from the output using grep and cut commands
job_name=$(echo "$output" | grep "Job_Name" | cut -d " " -f 3)

# Run the qdel command with the job ID and store the output
result=$(qdel "$job_id")

# Check if the result contains the word "deleted", which means the cancellation was successful
if [[ $result == *"deleted"* ]]; then
  # Print the confirmation message with the job ID and name
  echo "Your job with ID $job_id and name $job_name has been cancelled."
else
  # Print the error message with the job ID and name
  echo "There was an error cancelling your job with ID $job_id and name $job_name."
fi
