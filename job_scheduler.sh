#!/bin/bash
# Request 16 CPU cores
#$ -pe smp 16

# Request 240 hour runtime (i.e. 10 days)
#$ -l h_rt=240:0:0

# set to current working directory
#$ -cwd

# set the job name
#$ -N genome_assembly_results

# setting up the output directory
#$ -o results/

# Request 6GB RAM / core, (i.e. 96GB total)
#$ -l h_vmem=6G

# Send email notifications to your custom email address
#$ -M email@email.com
#$ -m beas

# try and catch error before running the code
set -e

###############################
# Unix commands here
###############################
