import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from mpi4py import MPI

import lammps

def main():

    comm = MPI.COMM_WORLD
    rank = comm.Get_rank
    size = comm.Get_size

    lmp = lammps()

    lmp.cmd.atom_style('atomic')
    lmp.command('boundary p p p')

    lmp.cmd.lattice('bcc', 2.866)
    lmp.cmd.region('box', 'block', 0, 40, 0, 40, 0, 40)
    lmp.cmd.create_box(1, 'box')
    lmp.cmd.create_atoms(1, 'region', 'box')

    lmp.cmd.pair_style('eam/fs')
    lmp.cmd.pair_coeff('*', '*', '../potentials/malerba.fs', 'Fe')

    lmp.cmd.timestep(0.001)

    lmp.cmd.neighbour(2.0, 'bin')
    lmp.cmd.neigh_modify('delay', 0, 'every', 1, 'check', 'yes')
    
    lmp.cmd.thermo(1000)
    lmp.cmd.thermo_style('custom', 'step', 'temp', 'etotal', 'press', 'vol')

    lmp.cmd.velocity('all', 'create', 1000.0, 1234, 'loop', 'geom')
    lmp.cmd.fix(1, 'all', 'nvt', 'temp', 1000.0, 1000.0, 1)

    lmp.cmd.run(500)

    return None

if __name__ == "__main__":
    main()