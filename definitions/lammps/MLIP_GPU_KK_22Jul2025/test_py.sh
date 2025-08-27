#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_GPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2

module load OpenMPI/4.1.4-GCC-12.2.0

# Suppress OpenFabrics (InfiniBand) warnings
export OMPI_MCA_btl=^openib

# Paths
CONTAINER_PATH=lmp_MLIP_KK.sif
HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

# Run LAMMPS inside the Apptainer container
srun apptainer exec \
     --bind $HOST_MPI_PATH:$HOST_MPI_PATH \
     $CONTAINER_PATH \
     lmp -k on g 2 -sf kk \
     -in ../00_examples/example_2.lmp
