#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=500MB
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

module load OpenMPI/4.1.4-GCC-12.2.0
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CONTAINER_PATH="$SCRIPT_DIR/lmp_CPU.sif"
INPUT="$SCRIPT_DIR/../../../../examples/lammps/scripts/example_1.lmp"
HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

srun apptainer exec \
     --bind $HOST_MPI_PATH:$HOST_MPI_PATH \
     $CONTAINER_PATH \
     lmp -in $INPUT