# StanageApptainerHub

A repository of [Apptainer](https://apptainer.org/) definition files for building containerised software on the University of Sheffield’s **Stanage** HPC cluster.

---

# 1. Introduction and Motivation

High-Performance Computing (HPC) is a powerful technology that enables researchers to run scientific codes efficiently by distributing workloads across many CPU cores and GPUs.  

At the University of Sheffield, there are currently two HPC systems: **Stanage** and **Bessemer**. Our group primarily uses **Stanage** since it offers the best specifications and is the most recent system. Bessemer is scheduled for decommissioning in the near future.  

While HPC provides enormous opportunities for research, making it accessible to all researchers and students also introduces challenges:

- **Diverse user backgrounds** – ranging from beginners to advanced users  
- **Conflicting software versions and dependencies** – difficult to manage on shared infrastructure  
- **Limited technical support** – environment troubleshooting can take significant time and effort  

### The environment management problem

One of the biggest obstacles in HPC usage is **managing consistent and reproducible environments**. Researchers often need specific versions of software and libraries, but installing these on a shared system can cause conflicts and waste valuable research time.  

### Our solution: Apptainer definition files

This repository provides **Apptainer definition files** for commonly used software in our research group. By standardising environments through containerisation, we aim to:

- **Provide reproducible environments** – ensuring consistent results across projects and collaborators  
- **Simplify setup for new users** – no need for complex dependency installations  
- **Reduce conflicts on shared infrastructure** – containers isolate software environments  
- **Improve portability of workflows** – making it easy to run the same software stack on different HPC systems or external collaborations  

---

This repository is intended as a growing hub of containerised definitions that will make HPC usage on Stanage more reliable, reproducible, and accessible to everyone.

# 2. Apptainer

[Apptainer](https://apptainer.org/) (formerly known as Singularity) is an open-source container platform designed for scientific and high-performance computing (HPC). Unlike Docker, which is often used in cloud and microservice environments, Apptainer focuses on reproducibility, mobility, and security for research workflows.

With Apptainer, researchers can:

- **Package complete environments** (software, libraries, dependencies) into portable container images.  
- **Run containers without root privileges**, making it suitable for shared HPC systems.  
- **Ensure reproducibility** by freezing software environments at specific versions.  
- **Easily share and distribute** pre-built scientific applications with collaborators.  

This makes Apptainer an ideal tool for academic and research computing, where consistent environments across users, systems, and institutions are critical.

For more information on Apptainer, please refer to their [documentation](https://apptainer.org/docs/user/main/index.html)

### How it works (WIP)

# 3. Repository Structure

```bash
STANAGEAPPTAINERHUB/
│
├── definitions/              # Apptainer definition files for different software
│   ├── lammps/               # LAMMPS builds
│   │   ├── HPC/              # HPC-optimised definitions (CPU, GPU, MLIP, etc.)
│   │   ├── LOCAL/            # Optional local builds for testing
│   │   └── README.md         # Notes on how to use LAMMPS containers
│   │
│   └── (other software…)     # Add future tools here (e.g. GROMACS, QE)
│
├── examples/                 # Example scripts and data
│   ├── lammps/               # Example LAMMPS inputs, potentials, job scripts
│   └── (other software…)     
│
├── tests/                    # Minimal test definitions & validation builds
│
├── docs/                     # Documentation (optional but recommended)
│   ├── build_your_own.md     # Guide for writing your own definition files
│   ├── lammps.md             # Instructions on how to use apptainer with LAMMPS
│   └── (other software...)   # Instructions on how to use other software
│
├── .gitignore
├── LICENSE                   
└── README.md
```

# 4. Software Status

| Software   | Version(s) Available | Containerised (Apptainer) | Notes |
|------------|----------------------|---------------------------|-------|
| LAMMPS     | 3Mar2020, 29Sep2021  | Yes                       | CPU, GPU, and MLIP builds available |
