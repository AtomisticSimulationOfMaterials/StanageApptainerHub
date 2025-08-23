#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=2

# Paths
CONTAINER_PATH=lmp_GPU_KK.sif

# Run LAMMPS inside the Apptainer container
srun apptainer exec --nv \
     $CONTAINER_PATH \
     lmp -k on g 2 -sf kk \
     -in ../00_examples/example_2.lmp
