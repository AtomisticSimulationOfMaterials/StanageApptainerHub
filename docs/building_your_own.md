# Build Your Own Apptainer Definition File

This guide explains how to create your own Apptainer definition file so you can build custom containers for the Stanage HPC (or any other Apptainer-supported system).

---

## 1. What is a Definition File?

An **Apptainer definition file** (`.def`) describes how to build a container. It specifies:
- The **base image** (e.g., Ubuntu, CentOS, Rocky Linux)
- **Software to install** (via package managers, source compilation, or conda/pip)
- **Environment variables** and paths
- **Startup scripts** and defaults

Once built, the `.def` file produces a `.sif` (Singularity Image Format) container image.

---

## 2. Minimal Example

A very simple definition file might look like this:

```def
Bootstrap: docker
From: ubuntu:22.04

%post
    apt-get update && apt-get install -y \
        python3 \
        python3-pip \
        git

%environment
    export PATH=/usr/local/bin:$PATH

%runscript
    echo "This container runs Python by default"
    python3 "$@"
