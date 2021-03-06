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

Singularity runs natively on linux, but is difficult to install and run on Windows and macOS. Docker is easier to install on all operating systems, but requires root access to run. So, we recommend building using Singularity on systems where root access is unavailable (like on supercomputing clusters) and Docker on all other systems.
## Dependencies

- Snakemake
- VSEARCH
- SINA
- FastTree
- Tidyverse and Ape (R Packages)

## Building without containers

1. Install dependencies
2. Download the raw data into data/raw.
3. Start the processing pipeline by invoking `snakemake --cores all report`.


## Building using Singularity Container

1. Install Singularity using the official guide at [sylabs.io](https://sylabs.io/guides/3.8/admin-guide/installation.html). On Windows, we recommend using WSL2 instead of the Vagrant VM recommended by Sylabs, and installing the latest version (>=3.8) of Singularity using [this link](https://github.com/sylabs/singularity/blob/master/INSTALL.md). Installing Singularity on macOS is cumbersome and not advised. Use the Docker Container methods instead.

2. Clone this repository to get the snakemake file (containing all the commands) and all the other scripts

```
git clone https://github.com/manutamminen/epicpcr_6.git
```

3. Move into folder

```
cd epicpcr_6
```

4. Make the setup script an executable and run it. This script downloads the raw data to the appropriate sub-folders.

```
chmod +x setup.sh && ./setup.sh
```

5. Download the singularity container, and rename it for convenience.

```
singularity pull library://jeevannavar/default/epicpcr-singularity-container:ver1 && \
mv epicpcr-singularity-container_ver1.sif container.sif
```

6. Run the snakemake pipeline

```
singularity run container.sif snakemake --cores all report
```


## Building using Docker Container

1. Install Docker Engine using their [official guide](https://docs.docker.com/engine/install/).  

2. Clone this repository in an appropriate directory to get the snakemake file (containing all the commands) and all the other scripts in the `src` directory.

```
git clone https://github.com/manutamminen/epicpcr_6.git
```

3. Move into directory. On windows, use `chdir` instead of `cd`

```
cd epicpcr_6
```

4. Download the docker image from Docker Hub.

```
docker pull jeevannavar/epicpcr_container:v1
```


5. Mount an instance of the docker container and start an interactive shell in it. Also, bind the current working directory (in the host) to a directory in the container instance. This allows you to access the Snakemake file from the container shell and also make changes to the host directory.

On linux and macOS:  
```
docker run -it -v $PWD:/test jeevannavar/epicpcr_container:v1
```

On Windows:  
```
docker run -it -v %CD%:/test jeevannavar/epicpcr_container:v1
```

You can replace `/test` with another location of your choice. That location will be bound to the working directory in the host filesystem. Modify command in next step accordingly.

6. Move to directory.

```
cd test
```

7. Make the setup script an executable and run it. This script downloads the raw data to the appropriate sub-directories.

```
chmod +x setup.sh && ./setup.sh
```

8. Run the snakemake pipeline.

```
snakemake --cores all report
```


### Extras

1. The definition file for building the Singularity container and the accompanying conda environment file are present in the `env` folder. To build the container yourself, move to the folder containing both `container.def` and `environment.yml` files, and use the following command: `sudo singularity build  container.sif container.def`

2. The Dockerfile for building the Docker container and the accompanying conda environemnt file are present in the `env` directory. To build the container yourself, move  to the folder containing both `Dockerfile` and `environemnt.yml` files, and use the following command: `docker build .`
 
3. If you would like to shell into the singularity container and then run commands from inside it, you can use the following command: `singularity shell container.sif`

4. If you are working on windows using a vagrant virtual machine to run singularity, you might run into an insufficient memory problem (`Fatal error: Unable to allocate enough memory`) at some point. In this case, use instructions [here](https://ostechnix.com/how-to-increase-memory-and-cpu-on-vagrant-machine/) to increase memory allocated to the vagrant machine. Some steps might require 6-7GB of RAM.

5. While using Docker, you might run into an insufficient memory problem as well. It may not be explicit, but processes will get killed during the run and the pipeline will not to run to completion. Either use the settings in Docker Desktop to increase memory to a value between 7-8GB or use the `--memory 7168m` flag with the `docker run` command to resolve the issue.
