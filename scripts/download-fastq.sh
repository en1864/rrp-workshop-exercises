#!/bin/bash

# Set some useful settings to handle errors
set -euo pipefail

# Define file paths

# Define file names
FASTQ_R1="SRR11518889_1.fastq.gz"
FASTQ_R2="SRR11518889_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889"

# Define URLs and file paths
FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"

DATA_DIR="../data/raw/fastq/SRP255885"
mkdir -p ${DATA_DIR}

#### Process the R1 file ####

# Download (using the -O command so it matches the file name we pull)
echo "Downloading the R1 file"
# -O: keep same file
# -s: don't print status bar or erros
# -S: but actually I do want to print errors

curl -sSO ${FASTQ_URL}/{$FASTQ_R1}
# Move the file
mv ${FASTQ_R1} ${DATA_DIR}/
# Print the number of lines in the file
echo "Number of lines in R1"
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l


#### Process the R2 file ####
echo "Downloading the R2 file"
# Download (using the -O command so it matches the file name we pull)
curl -O ${FASTQ_URL}/{$FASTQ_R2}
# Move the file
mv ${FASTQ_R2} ${DATA_DIR}/
# Print the number of lines in the file
echo "Number of line in R2"
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l




