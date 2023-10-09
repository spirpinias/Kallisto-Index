#!/bin/bash 

set -ex

source ./config.sh

if [ "$fasta_count" -eq 1 ]; then

  echo "Creating index from a single ${suffix_fasta} file"

  ref_files=$(find -L ../data -name "*$suffix_fasta")

elif [ "$fasta_count" -gt 1 ]; then  

  echo "Creating index from multiple ${suffix_fasta} files"

  ref_files=$(find -L ../data -name "*$suffix_fasta") 

else
  echo "Please ensure your data has at least 1 reference sequence. Check the README for acceptable formats."
fi

kallisto index \
    -i ../results/${output_file}.idx \
    ${ref_files} \
    ${kmer_size} \
    ${mask_sequence} \
    ${num_threads} \
    ${make_unique} \
    ${index_amino_acid} \
    ${distin} \
    ${len_minimize} \
    ${targets_equiv}