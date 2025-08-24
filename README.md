# StanageApptainerHub
A repository of Apptainer defintion files for building containerised software on the Univeristy of Sheffield's Stanage HPC cluster.

## Introduction and Motivation
- HPC is a very powerful technology for efficient use of scientific codes.
- It allows us to distribute processes in software to many many processes that can belong to CPUs or GPUs.
- The University of Sheffield has two HPC systems: Stanage and Bessemer.
- We mainly use Stanage as that has the best specs and is the newest system. Also, Bessemer is being decomissioned at some point.

- The HPC is open to all researchers and students at the University.
- This is good.
- However there are several issues we face when making this tool available to everyone.
- Diverse user backgrounds (from begineer to advanced)
- Confilting software versions and dependencies
- (Ocassionally) limited support staff for environment troubleshooting and technical support

- To address this we are building a repository of apptainer definitions. This will allow us to get around some of these issues.
- Provide reproducible environments. --> We can standardise use of software across the research group. --> When sharing our work with people from other organisations, they can easily find out what version of software we are using to replicate our work/build off of it.
- Simplify software setup for new users
- Reduce dependency conflicats on shared infracstructure
- Allow research workflows to be portable across different HPC systems.

# Apptainer

[Apptainer](https://apptainer.org/) (formerly known as Singularity) is an open-source container platform designed for scientific and high-performance computing (HPC). Unlike Docker, which is often used in cloud and microservice environments, Apptainer focuses on reproducibility, mobility, and security for research workflows.

With Apptainer, researchers can:

- **Package complete environments** (software, libraries, dependencies) into portable container images.  
- **Run containers without root privileges**, making it suitable for shared HPC systems.  
- **Ensure reproducibility** by freezing software environments at specific versions.  
- **Easily share and distribute** pre-built scientific applications with collaborators.  

This makes Apptainer an ideal tool for academic and research computing, where consistent environments across users, systems, and institutions are critical.

For more information on Apptainer, please refer to their [documentation](https://apptainer.org/docs/user/main/index.html)

## How it works (A introduction)


# Structure

# Software

# Instructions
