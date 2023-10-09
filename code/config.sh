#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

# Search the Environment for the type of Fasta.
some_fasta_file=$(get_fasta_file --dir ../data)
echo "some_fasta_file: $some_fasta_file"

# Extract suffixes.
suffix_fasta=$(basename "$some_fasta_file")
suffix_fasta=$(sed "s/.*\.f/\.f/" <<< "$suffix_fasta")
echo "Found suffix $suffix_fasta"

# Count the Fasta Files.
fasta_count=$(find -L ../data -name "*$suffix_fasta" | wc -l) 

# Kallisto

if [ -z "${1}" ]; then
  num_threads="--threads=$CO_CPUS"
else
  if [ "${1}" -gt $CO_CPUS ]; then
    echo "Requesting more threads than available. Setting to Max Available."
    num_threads="--threads=$CO_CPUS"
  else
    num_threads="--threads=${1}"
  fi
fi

if [ -z "${2}" ]; then
  kmer_size=""
else
  kmer_size="--kmer-size=${2}"
fi

if [ -z "${3}" ]; then
  output_file=$(basename -s $suffix_fasta "${some_fasta_file}")
else
  output_file="${3}"
fi

if [ -z "${4}" ]; then
  mask_sequence=""
else
  mask_sequence="--d-list=${4}"
fi

if [ "${5}" == "True" ]; then
  make_unique="--make-unique"
else
  make_unique=""
fi

if [ "${6}" == "True" ]; then
  index_amino_acid="--aa"
else
  index_amino_acid=""
fi

if [ "${7}" == "True" ]; then
  distin="--distinguish"
else
  distin=""
fi

if [ -z "${8}" ]; then
  len_minimize=""
else
  len_minimize="--min-size=${8}"
fi

if [ -z "${9}" ]; then
  targets_equiv=""
else
  targets_equiv="--ec-max-size=${9}"
fi