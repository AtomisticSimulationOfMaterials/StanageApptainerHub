#!/bin/bash
#SBATCH --job-name=BUILD_LAMMPS_CPU
#SBATCH --mail-user=eledmunds1@sheffield.ac.uk
#SBATCH --time=00:30:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Load the specific MPI module on the HPC
module load OpenMPI/4.1.4-GCC-12.2.0

# Define the path to your LAMMPS container
CONTAINER_PATH=/path/to/your/lammps.sif

# Define the path to the host's MPI libraries
HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

# Run the container, binding the host's MPI libraries for parallel execution
srun apptainer run --bind $HOST_MPI_PATH:$HOST_MPI_PATH $CONTAINER_PATH -in input.lammps
