#!/bin/bash

# Script to create karyotype file for Circos

# Creates output file formatted like:
# chr - pg1 1 0 89643857 chr1

# Variables
fasta_index=${HOME}/data/generosa/Panopea-generosa-v1.0.fa
karyo_file=karyotype.pg.txt
species=pg

while IFS=$'\t' read -r line
do
	# Capture scaffold number and strip leading '0'
	scaffold_num=$(echo "${line}" | awk -F"[_\t]" '{print $2}' | sed 's/^0//')

	scaffold_length=$(echo "${line}" | awk '{print $2}')
	printf "chr - %s\n" "${species}${scaffold_num} ${scaffold_num} 0 ${scaffold_length} chr${scaffold_num}"
done < "${fasta_index}" >> "${karyo_file}"