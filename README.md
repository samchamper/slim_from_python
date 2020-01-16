# Running SLiM in arrays, from Python, and on a computing cluster

You may find yourself in the situation that you have a SLiM (https://github.com/MesserLab/SLiM) simulation with several defined parameters, and you want to try varying these parameters through a plausable range in order to determine how the model will perform in various configurations.

Naturally, you can just vary the parameters by hand and record the results. However, that wouldn't be very fun once you have more than two or three parameters that you want to vary. Furthermore, running SLiM many times sequentially takes a lot longer than doing it in parallel!

In this situation, there are several options. This repository is designed to demostrate the basics of several of these methods!

## 1 - Using bash to run SLiM

Just as you can use the defineConstant() function to... well... define constants within SLiM, you can use the command line "-d" argument to do so as well.

For example invoking: ``slim -d X=0.0 -d Y=1.0 filename.slim`` will run SLiM with X in the namespace as 0 and Y as 1. This is quite nice in how minimal it is, and can be used in conjunction with a bash (or other shell) to run SLiM in parallel in a nice array.

Using python to run SLiM takes advantage of this same method of command line configuration. One thing you'll need to make sure to do is not define the same constants twice! You'll want to use an if statement with the exists("CONSTANT_NAME") function within SLiM to prevent defining constants that are already defined. See the "minimal_gene_drive.slim" file for an example of how this is done.

In this repository, the "array_without_python.sh" file demonstrates how to accomplish parallel running with bash!

## 2 - Using Python to run SLiM

You might find that you want to do some complex analyses on your data which are inconvenient to do from within SLiM itself. Perhaps you want to compare something about the population accross the entire time span of the simulation. If so, you can capture the results of SLiM within Python using the subprocess library, and then use all of your favorite python libraries to analyze the output!

For a minimal example of such a driver, see the minimal_slim_driver.py file in this repository.

## 3 - Using Python and bash to run an array in parallel

The idea of running SLiM in parallel with bash and running SLiM with python, can of course, be combined. The "array_with_python.sh" script in this repository demonstrates this method.

## 4 - Using Python on a computing cluster to run an array in parallel

If you have access to a computing cluster, many times you will be submitting "jobs" to a "job scheduler". The scripts you will use to run an array of jobs depend on exactly what job scheduler your computer cluster uses, so go talk to your friendly cluster herder. Included in this repository are scripts for running an array of jobs using two popular schedulers: the Sun Grid Engine (aka SGE), and SLURM. Files for these examples include a quick script "generate_params_file.py", as well as "params.txt" and the cluster scripts themselves, "SGE.sh" and "SLURM.sh".

