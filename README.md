# epicPCR experiment July 7 2021

The aim of this experiment was to find an optimal concentration gradient for synthetic and biological standards and to optimize the barcode concentration

The following samples are included:

|Sample name|Sample type|Mock status|Magnetic status|Phylotype|
| :--- | :--- | :--- | :--- | :--- |
|BiolstdMockMag16S|Biological standard|Mocks|Magnetic selection|16S|
|BiolstdMockMag18S|Biological standard|Mocks|Magnetic selection|18S|
|BiolstdMockNomag16S|Biological standard|Mocks|No magnetic selection|16S|
|BiolstdMockNomag18S|Biological standard|Mocks|No magnetic selection|18S|
|BiolstdNomockMag16S|Biological standard|No mocks|Magnetic selection|16S|
|BiolstdNomockMag18S|Biological standard|No mocks|Magnetic selection|18S|
|BiolstdNomockNomag16S|Biological standard|No mocks|No magnetic selection|16S|
|BiolstdNomockNomag18S|Biological standard|No mocks|No magnetic selection|18S|
|BiolstdWWMockMag16S|WW + Biological standard|Mocks|Magnetic selection|16S|
|BiolstdWWMockMag18S|WW + Biological standard|Mocks|Magnetic selection|18S|
|BiolstdWWMockNomag16S|WW + Biological standard|Mocks|No magnetic selection|16S|
|BiolstdWWMockNomag18S|WW + Biological standard|Mocks|No magnetic selection|18S|
|BiolstdWWNomockMag16S|WW + Biological standard|No mocks|Magnetic selection|16S|
|BiolstdWWNomockMag18S|WW + Biological standard|No mocks|Magnetic selection|18S|
|BiolstdWWNomockNomag16S|WW + Biological standard|No mocks|No magnetic selection|16S|
|BiolstdWWNomockNomag18S|WW + Biological standard|No mocks|No magnetic selection|18S|
|WWMockMag16S|WW|Mocks|Magnetic selection|16S|
|WWMockMag18S|WW|Mocks|Magnetic selection|18S|
|WWMockNomag16S|WW|Mocks|No magnetic selection|16S|
|WWMockNomag18S|WW|Mocks|No magnetic selection|18S|
|WWNomockMag16S|WW|No mocks|Magnetic selection|16S|
|WWNomockMag18S|WW|No mocks|Magnetic selection|18S|
|WWNomockNomag16S|WW|No mocks|No magnetic selection|16S|
|WWNomockNomag18S|WW|No mocks|No magnetic selection|18S|

Raw data available at https://zenodo.org/record/5101839

Lab protocols available at https://github.com/manutamminen/epicpcr_6/blob/main/docs/protocols.md

Summary of the results available at https://github.com/manutamminen/epicpcr_6/blob/main/docs/index.md


# Building

## Dependencies

- Snakemake
- VSEARCH
- SINA
- FastTree
- Tidyverse and Ape (R Packages)

Download the raw data into data/raw.

Start the processing pipeline by invoking `snakemake --cores all report`.


## Building using Singularity Container

1. Install Singularity using the official guide at [sylabs.io](https://sylabs.io/guides/3.8/admin-guide/installation.html)

2. Clone this repository to get the snakemake file (containing all the commands) and all the other scripts

```
git clone https://github.com/manutamminen/epicpcr_6.git
```

3. Move into folder

```
cd epicpcr_6
```

4. Make the setup script an executable and run it. This script downloads the raw data and the container to the appropriate sub-folders.

```
chmod +x setup.sh
./setup.sh
```

5. Run the snakemake pipeline

```
singularity run container.sif snakemake --cores all report
```

### Extras

1. The definition file for building the singularity container and the accompanying conda environment file are present in the `env` folder. To build the container yourself, move to the folder containing both `container.def` and `environment.yml` files, and use the following command: `sudo singularity build  container.sif container.def`
 
2. If you would like to shell into the singularity container and then run commands from inside it, you can use the following command: `singularity shell container.sif`

3. If you are working on windows using a vagrant virtual machine to run singularity, you might run into an insufficient memory problem (`Fatal error: Unable to allocate enough memory`) at some point. In this case, use instructions [here](https://ostechnix.com/how-to-increase-memory-and-cpu-on-vagrant-machine/) to increase memory allocated to the vagrant machine. Some steps might require 6-7GB of RAM.
