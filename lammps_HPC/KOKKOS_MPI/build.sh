#!/bin/bash
#SBATCH --job-name=BUILD_LAMMPS_KOKKOS_MPI
#SBATCH --mail-user=eledmunds1@sheffield.ac.uk
#SBATCH --time=00:30:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Build container
apptainer build lmp_kk.sif lammps_KOKKOS_MPI.def
