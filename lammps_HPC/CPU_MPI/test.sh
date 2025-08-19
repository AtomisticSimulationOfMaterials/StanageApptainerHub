#!/bin/bash
#SBATCH --job-name=BUILD_LAMMPS_CPU
#SBATCH --mail-user=eledmunds1@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1

# Load the host's MPI module
module load OpenMPI/4.1.4-GCC-12.2.0

# Set the number of OpenMP threads to the number of allocated CPUs per task
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Define the path to your Apptainer container
CONTAINER_PATH=lmpcpu.sif

# Define the path to the host's MPI libraries
HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

# Run the container using srun, binding the host's MPI libraries
mpirun -np $ntasks apptainer run --bind $HOST_MPI_PATH:$HOST_MPI_PATH $CONTAINER_PATH -in ../00_examples/example.lmp



