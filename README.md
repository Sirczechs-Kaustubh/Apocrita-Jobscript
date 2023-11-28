# HPC Job Scripts

This repository contains four bash scripts that can help you with submitting, checking, and cancelling jobs on a High Performance Computing (HPC) cluster that uses the Sun Grid Engine (SGE) system. The scripts are:

- canceljob.sh: A script that cancels a submitted job using the qdel command. It also confirms the cancellation and prints the job ID and name of the cancelled job.
- checkjob.sh: A script that checks the status of a submitted job using the qstat command. It also displays the job name, queue, priority, and state of the job.
- job_scheduler.sh: A script that submits a job script to the queue using the qsub command. It also prints the job ID and the estimated start time of the job.
- submit.sh: A script that submits a job script to the queue using the sbatch command. It also prints the job ID and the estimated start time of the job.

## Prerequisites

To use these scripts, you need to have access to an HPC cluster that uses the SGE system. You also need to have a terminal emulator, such as PuTTY or MobaXterm, to connect to the cluster. Alternatively, you can use a web browser that supports SSH and X11 forwarding, such as Firefox or Chrome, to access the HPC web portal.

## Usage

To use these scripts, you need to follow these steps:

- Download or clone this repository to your local machine.
- Transfer the scripts to your home directory on the HPC cluster using a file transfer tool, such as WinSCP or FileZilla.
- Make the scripts executable by running the command `chmod +x *.sh` in the terminal.
- Create a job script file that contains the commands and options for your HPC job. For example, you can create a file named job_scheduler.sh with the following content:

```bash
#!/bin/bash
# Request 4 cores, 8GB of RAM, and 2 hours of runtime
#$ -pe smp 4
#$ -l h_vmem=8G
#$ -l h_rt=2:0:0
# Load the Python module
module load python
# Run a Python program
python myprogram.py

