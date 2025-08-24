#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_KK
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=1

# Paths
CONTAINER_PATH=lmp_GPU_KK.sif
INPUT=../../../../examples/lammps/scripts/example_1.lmp

# Run LAMMPS inside the Apptainer container
apptainer exec --nv lmp_GPU_KK.sif \
     mpirun.openmpi -np $SLURM_NTASKS \
     lmp -k on g 2 -sf kk -in $INPUT
