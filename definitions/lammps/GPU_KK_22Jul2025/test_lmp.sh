#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_KK
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:05:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=2

# Paths
CONTAINER_PATH=lmp_KK_22Jul2025.sif
INPUT=../00_scripts/example_2.lmp

# Run LAMMPS inside the Apptainer container
apptainer exec --nv $CONTAINER_PATH \
     mpirun.openmpi -np $SLURM_NTASKS \
     lmp -k on g 1 -sf kk -in $INPUT
