#!/bin/bash

# ----------------QSUB Parameters----------------- #
#PBS -S /bin/bash
#PBS -q default
#PBS -l nodes=1:ppn=1,mem=2gb
#PBS -M shrvstv3@illinois.edu
#PBS -m abe
#PBS -N GrNM_run
#PBS -d /home/n-z/shrvstv3/no_backup/GrNM/
# ----------------Load Modules-------------------- #
module load matlab
# ----------------Your Commands------------------- #
matlab -nodisplay -nosplash -r "addpath(genpath('./')); GrNM('GrNM_input.txt', 'GrNM_output'); exit;"

