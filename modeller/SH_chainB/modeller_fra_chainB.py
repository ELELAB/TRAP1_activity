#comparative modeling with multiple templates
from modeller import *              # Load standard Modeller classes
from modeller.automodel import *    # Load the automodel class

class MyModel(automodel):
    def select_atoms(self):
        # Select residues 1 and 2 (PDB numbering)
        return selection(self.residue_range('39:', '46:'), self.residue_range('91:', '102'), self.residue_range('263:', '270:'), self.residue_range('283:', '286:'), self.residue_range('530:', '545:'), self.residue_range('608:', '611:'))

        # The same thing from chain A (required for multi-chain models):
        # return selection(self.residue_range('1:A', '2:A'))

        # Residues 4, 6, 10:
        # return selection(self.residues['4'], self.residues['6'],
        #                  self.residues['10'])

        # All residues except 1-5:
        # return selection(self) - selection(self.residue_range('89:A', '150:A'), self.residue_range('42:A', '63:A'))


env = environ()
# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

env.io.hetatm = True
# selected atoms do not feel the neighborhood
# env.edat.nonbonded_sel_atoms = 2

a = MyModel(env,
            alnfile  = 'chainB.ali', # alignment filename
            knowns   = ('4ipe_chainB_MOD'),     # codes of the templates
            sequence = 'TRAP1_chainB')               # code of the target
a.starting_model= 1                 # index of the first model
a.ending_model  = 10                 # index of the last model
                                    # (determines how many models to calculate)
a.make()                            # do the actual comparative modeling
