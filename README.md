# epicPCR experiment May 28 2021

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

Lab protocols available at 

Summary of the results available at 


# Building

## Dependencies

- Snakemake
- VSEARCH
- SINA
- FastTree
- Tidyverse

Download the raw data into data/raw.

Start the processing pipeline by invoking `snakemake --cores all report`.


