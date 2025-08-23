#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=500MB
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

module load OpenMPI/4.1.4-GCC-12.2.0

# Set number of threads per task
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Suppress OpenFabrics (InfiniBand) warnings
export OMPI_MCA_btl=^openib

# Paths
CONTAINER_PATH=lmp_CPU.sif
INPUT=../00_examples/example_1.lmp

HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

# Run LAMMPS inside the Apptainer container
srun apptainer exec \
     --bind $HOST_MPI_PATH:$HOST_MPI_PATH \
     $CONTAINER_PATH \
     lmp -in $INPUT
