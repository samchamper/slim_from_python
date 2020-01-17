#!/bin/bash -l
#SBATCH --ntasks=1
#SBATCH --mem=1000
#SBATCH --partition=regular,regularA
#SBATCH --job-name=BASIC_DRIVE
#SBATCH --output=output.txt
#SBATCH --array=1-2601

# This script runs one SLiM simulation per cluster job,
# which fine if the SLiM jobs are large enough to warrant this.
# In this repo, the SLiM runs take very little time, so
# it would be better to use the technique in SLURM.sh,
# which runs multiple simulations per cluster job.

# Create and move to working directory for job:
WORKDIR=/SSD/$USER/$JOB_ID-$SLURM_ARRAY_TASK_ID
mkdir -p $WORKDIR
cd $WORKDIR

# Copy files over to working directory:
# Replace SCRIPT_LOCATION with wherever the desired files are.
SCRIPT_LOCATION=/home/samchamper/slim/slim_from_python
cp $SCRIPT_LOCATION/minimal_gene_drive.slim .
cp $SCRIPT_LOCATION/minimal_slim_driver.py .
cp $SCRIPT_LOCATION/params.txt .

# Include SLiM in the path.
PATH=$PATH:/home/samchamper/slim/build
export PATH

# The program and command line args to be run are the i-th line of params.txt
prog=`sed -n "${SLURM_ARRAY_TASK_ID}p" params.txt`

# Do computation
$prog > ${SLURM_ARRAY_TASK_ID}.part
cp ${SLURM_ARRAY_TASK_ID}.part $SCRIPT_LOCATION/SLURM_data

# Clean up working directory:
rm -r $WORKDIR