#!/bin/bash
#SBATCH --job-name=BUILD_BASE_ENV
#SBATCH --mail-user=eledmunds1@sheffield.ac.uk
#SBATCH --time=00:05:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1

# Build container
apptainer build test.sif test.def


