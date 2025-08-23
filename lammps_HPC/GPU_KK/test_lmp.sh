#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=2

module load OpenMPI/4.1.4-GCC-12.2.0

# Suppress OpenFabrics (InfiniBand) warnings
export OMPI_MCA_btl=^openib

# Paths
CONTAINER_PATH=lmp_GPU_KK.sif
HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

# Run LAMMPS inside the Apptainer container
apptainer exec \
     $CONTAINER_PATH \
     mpiexec.openmpi -np $SLURM_NTASKS \
     lmp -k on g $SLURM_GRES -sf kk \
     -in ../00_examples/example_2.lmp
