#!/bin/bash -l
#SBATCH --ntasks=1
#SBATCH --mem=1000
#SBATCH --partition=regular,regularA
#SBATCH --job-name=BASIC_DRIVE
#SBATCH --output=output.txt
#SBATCH --array=1-153

# Include SLiM in the path.
PATH=$PATH:/home/samchamper/slim/build
export PATH

# The jobs in this example repo are super short, and there is
# overhead time associated scheduling them on the cluster. Thus,
# each job will do 17 runs of SLiM using this for loop:

startIndex=$(echo "($SLURM_ARRAY_TASK_ID-1)*17+1" | bc)
for (( i=startIndex; i<startIndex+17; i++ ))
do
    # Create and move to working directory for job:
    WORKDIR=/SSD/$USER/$JOB_ID-$i
    mkdir -p $WORKDIR
    cd $WORKDIR

    # Copy files over to working directory:
    SCRIPT_LOCATION=/home/samchamper/slim/slim_from_python
    cp $SCRIPT_LOCATION/minimal_gene_drive.slim .
    cp $SCRIPT_LOCATION/minimal_slim_driver.py .
    cp $SCRIPT_LOCATION/params.txt .

    # The program and command line args to be run are the i-th line of params.txt
    prog=`sed -n "${i}p" params.txt`

    # Do computation
    $prog > ${i}.part
    cp ${i}.part $SCRIPT_LOCATION/SLURM_data

    # Clean up working directory:
    rm -r $WORKDIR
done
