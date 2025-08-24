# ----------------------------------------------------------
# Thermalization Script for BCC Iron - Kokkos
# Author: Ethan L. Edmunds
# Year: 2025
# Purpose: Equilibrate a BCC Iron system using NPT dynamics
# ----------------------------------------------------------

# Imports
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

import atomman as am

from lammps import lammps

def main():

    # Initialize LAMMPS
    lmp = lammps(cmdargs=['-k','on','g','2','-sf','kk'])

    # ---------- Initialize Simulation ------------------------
    lmp.cmd.clear()
    lmp.cmd.units('metal')
    lmp.cmd.dimension(3)
    lmp.cmd.boundary('p', 'p', 'p')
    lmp.cmd.atom_style('atomic')
    lmp.cmd.atom_modify('map', 'array')

    # ---------- Create Atomistic System ----------------------
    lmp.cmd.lattice('bcc', 2.866)
    lmp.cmd.region('box', 'block', 0, 40, 0, 40, 0, 40)
    lmp.cmd.create_box(1, 'box')
    lmp.cmd.create_atoms(1, 'box')

    # ---------- Define Interatomic Potential -----------------
    lmp.cmd.pair_style('eam/fs')
    lmp.cmd.pair_coeff('*', '*', '../00_potentials/malerba.fs', 'Fe')

    # Neighbor list settings
    lmp.cmd.neighbor(2.0, 'bin')
    lmp.cmd.neigh_modify('delay', 10, 'check', 'yes')

    # ---------- Set Simulation Parameters -------------------
    lmp.cmd.reset_timestep(0)
    lmp.cmd.timestep(0.001)

    # Assign initial velocities
    lmp.cmd.velocity('all', 'create', 1000.0, 124312, 'mom', 'yes', 'rot', 'yes', 'dist', 'gaussian')

    # Apply NPT ensemble for thermalization
    lmp.cmd.fix(1, 'all', 'npt', 'temp', 1000.0, 1000.0, 0.1, 'iso', 0.0, 0.0, 0.1)  # dt=0.001, so 100*dt=0.1

    # ---------- Output Settings -----------------------------
    lmp.cmd.thermo(10)
    lmp.cmd.thermo_style('custom', 'step', 'dt', 'time', 'temp', 'press', 'ke', 'pe', 'etotal')

    # ---------- Run Simulation -------------------------------
    lmp.cmd.run(500)

    return None

if __name__ == "__main__":
    main()
