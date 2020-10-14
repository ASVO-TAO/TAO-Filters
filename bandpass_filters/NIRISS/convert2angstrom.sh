#!/bin/bash
export infile=$1
export outfile=${1%.*}.dat
python convert2angstrom.py $infile > $outfile
