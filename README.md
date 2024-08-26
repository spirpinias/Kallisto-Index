# Kallisto 

Kallisto is a program for quantifying abundances of transcripts from bulk and single-cell RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. This tool generates the index required by the Kallisto-Quant. 

## Input data

In **data** directory, tool searches for .fasta, .fa, .fna transcriptome of nucleotide or amino acid sequences. 

- **Please Take Note**
- **The Fasta file supplied can be either in plaintext or gzipped format**
- **Do not supply the genome Fasta file; the Fasta file must be a transcriptome Fasta**

## App Panel Parameters 

Number of Threads
- Default is all available.   
- If you request more than is available, the number selected will be all available. 

Kmer Size 
- for DeBruijn Graph Int <= 31 (Must be Odd Integer)

Name of Index
- the prefix of your index file. 

Mask for Quantification
- relative path to a .fasta file with sequences that will be masked during indexing of the genome.

Make Unique
- Replace repeated target names with unique names.

Generate Index from a FASTA-File Containing Amino Acid sequences
- True or False

Generate Index where sequences are distinguished by the sequence name.
- True or False

Length of Minimizer
- Integer Value 
- Default is Automatically Chosen

Maximum Number of Targets in an Equivalence Class
- Integer Value
- Default is No Maximum

## Output

**.idx**: Index

## Source 

https://pachterlab.github.io/kallisto/about
https://pachterlab.github.io/kallisto/manual
