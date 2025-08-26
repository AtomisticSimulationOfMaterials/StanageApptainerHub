# LAMMPS

The Large-scale Atomic/Molecular Massively Parallel Simulator (LAMMPS) is a popular tool for conducting molecular dynamics simulations. The code is maintained by Sandia National Labs. For more information, refer to either the [LAMMPS webpage](https://www.lammps.org/#gsc.tab=0) or [documentation](https://docs.lammps.org/).

> **Note:** All LAMMPS builds in this repo are built with MPI support.

## 1. How to build LAMMPS

Each of the apptainer definition files come with their own *build.sh* script. Each of these scripts are designed to call apptainer and build a apptainer container using the definition file. An example is below:

```bash
#!/bin/bash
#SBATCH --job-name=BUILD_LAMMPS_XXX
#SBATCH --mail-user=your_name@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=1GB
#SBATCH --cpus-per-task=20
#SBATCH --ntasks=1

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module load OpenMPI/4.1.4-GCC-12.2.0

# Build container
apptainer build lmp_CPU.sif lmp_CPU.def
```

In this example, we are building a CPU only enabled version. The command at the bottom asks apptainer to build a container (called lmp_CPU.sif) using the definition file (called lmp_CPU.def).

The reason why we ask for more than 1 core while building the container is because we build LAMMPS using CMake. Building and compiling code can be a cumbersome task, so we can use multiple processes to speed up the build process.

## 2. Running LAMMPS Simulations

### CPU Versions
Generally, running simulations with LAMMPS goes like this:

1) We load the OpenMPI module from Stanage
2) We get the path to Stanage's OpenMPI executable 

```bash
#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_CPU
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=500MB
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4

module load OpenMPI/4.1.4-GCC-12.2.0
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

HOST_MPI_PATH=/opt/apps/testapps/el7/software/staging/OpenMPI/4.1.4-GCC-12.2.0

CONTAINER_PATH=lmp_CPU.sif

INPUT=../00_scripts/example_1.lmp

srun apptainer exec \
     --bind $HOST_MPI_PATH:$HOST_MPI_PATH \
     $CONTAINER_PATH \
     lmp -in $INPUT
```

```bash
srun apptainer exec \
     --bind $HOST_MPI_PATH:$HOST_MPI_PATH \
     $CONTAINER_PATH \
     python $INPUT
```

### GPU (KOKKOS) Versions

```bash
#!/bin/bash
#SBATCH --job-name=TEST_LAMMPS_KK
#SBATCH --mail-user=---@sheffield.ac.uk
#SBATCH --time=00:10:00
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=1

# Paths
CONTAINER_PATH=lmp_GPU_KK.sif
INPUT=../00_scripts/example_2.lmp

# Run LAMMPS inside the Apptainer container
apptainer exec --nv lmp_GPU_KK.sif \
     mpirun.openmpi -np $SLURM_NTASKS \
     lmp -k on g 2 -sf kk -in $INPUT
```

```bash
apptainer exec --nv lmp_GPU_KK.sif \
     mpirun.openmpi -np $SLURM_NTASKS \
     python $INPUT
```

With Python there is a caveate, as we need to tell LAMMPS (through Python) to use GPUs and the Kokkos library for execution of the script. We achieve this by passing cmdargs command when we create a LAMMPS instance using Python:

```bash

```

## 3. Supplementary Information

### LAMMPS Build Process