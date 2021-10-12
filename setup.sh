#!/bin/bash

# Download and prepare raw data
mkdir data
cd data
wget https://zenodo.org/record/5101839/files/epic6.tar.gz
tar -xvf epic6.tar.gz
rm epic6.tar.gz
mv epic6 raw
cd ..

# Archive the old final output file
cd docs
mv index.md index.md.archive
cd ..

# Download the singularity container
singularity pull library://jeevannavar/default/epicpcr-singularity-container:ver1
mv epicpcr-singularity-container_ver1.sif container.sif
