#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=500MB
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

CONTAINER_PATH=lmp_CPU.sif

INPUT=../00_scripts/example_1.lmp

apptainer exec $CONTAINER_PATH \
     mpirun.openmpi -np $SLURM_NTASKS \
     lmp -in $INPUT