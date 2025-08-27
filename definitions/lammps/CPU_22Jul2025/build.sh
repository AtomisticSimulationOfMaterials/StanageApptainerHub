#!/bin/bash
#SBATCH --job-name=BUILD_LAMMPS_CPU
#SBATCH --mail-user=eledmunds1@sheffield.ac.uk
#SBATCH --time=00:30:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module load OpenMPI/4.1.4-GCC-12.2.0

# Build container
apptainer build lmp_CPU_22Jul2025.sif lmp_CPU_22Jul2025.def


