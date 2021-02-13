#!/bin/sh
## Please download the tAI calculation source code from github 
## using following link https://github.com/mariodosreis/tai
## Set up the code as per the guidelines given at the above link.
## Download the gene copy number of the host of the visus from GtRNADB.
## Provide the name of protein, virus id and host id in list. 
exec < $1
while read PTN VID HID
do
 mkdir <path to tAI setup>/$PTN"_"$HID
 cd <path to tAI setup>/$PTN"_"$HID
 cp ~/bin/codonM ~/bin/codonZ ~/bin/codonw ~/bin/tAI.R ~/bin/dos2unix . 
 cp <path to fasta file of nucleotide sequence>/$PTN".fasta" ./$PTN.fna
 cat $PTN.fna $PTN.fna $PTN.fna > VIRUS.ffn
 awk '{print $2}' <path to gene copy number file of host>/$HID.trna > HOST.trna
 perl codonM VIRUS.ffn VIRUS.m
 perl codonZ VIRUS.ffn VIRUS.w
 Rscript tAI.R > $PTN.out
done
