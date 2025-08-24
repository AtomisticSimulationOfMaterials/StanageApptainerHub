#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=500MB
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

module load OpenMPI/4.1.4-GCC-12.2.0
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# ---------------- Determine script directory ----------------
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Container and input paths (absolute)
CONTAINER_PATH=$(realpath "$SCRIPT_DIR/lmp_CPU.sif")
INPUT=$(realpath "$SCRIPT_DIR/../../../../examples/lammps/scripts/example_1.lmp")
POTENTIALS_DIR=$(realpath "$SCRIPT_DIR/../../../../examples/lammps/potentials")

HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

# Bind MPI libraries and potentials folder
BIND_PATHS="$HOST_MPI_PATH:$HOST_MPI_PATH,$POTENTIALS_DIR:$POTENTIALS_DIR"

# ---------------- Run LAMMPS ----------------
srun apptainer exec \
     --bind $BIND_PATHS \
     $CONTAINER_PATH \
     lmp -in $INPUT