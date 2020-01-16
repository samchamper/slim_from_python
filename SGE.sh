#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -N BASIC_DRIVE
#$ -o output.txt
#$ -j y
#$ -t 1-2500

# Create and move to working directory for job:
WORKDIR=/SSD/$USER/$JOB_ID-$SGE_TASK_ID
mkdir -p $WORKDIR
cd $WORKDIR

# Copy files over to working directory:
SCRIPT_LOCATION=/home/samchamper/slim/slim_from_python
cp $SCRIPT_LOCATION/minimal_gene_drive.slim .
cp $SCRIPT_LOCATION/minimal_slim_driver.py .
cp $SCRIPT_LOCATION/params.txt .

# Include SLiM in the path.
PATH=$PATH:/home/samchamper/slim/build
export PATH

prog=`sed -n "${SGE_TASK_ID}p" params.txt`

# Do computation
$prog > ${SGE_TASK_ID}.part
cp ${SGE_TASK_ID}.part $SCRIPT_LOCATION/SGE_data

# Clean up working directory:
rm -r $WORKDIR
