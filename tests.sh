#!/bin/bash

find . -type f \( -iname \*.dat -o -iname \*.dati \) -exec awk '{if(NR==1 && NF != 1) {print("\nFirst line should contain only the total number of lines in the filter file"); print "Offending file, line number, and line content:", ARGV[1], NR, $0; exit 1;}}' {} \; 
find . -type f \( -iname \*.dat -o -iname \*.dati \) -exec awk '{if(NR > 1 && NF != 2) {print("\nSecond line onwards should contain exactly 2 columns -- wavelength and transmission"); print "Offending file, line number, and line content:", ARGV[1], NR, $0; exit 1;}}' {} \; 
find . -type f \( -iname \*.dat -o -iname \*.dati \) -exec wc -l {} \; |  awk '{if($1 <= 3) {print("Number of lines is too small to reliably use a spline within the TAO SED module. Line content = %s\n", $0); exit 1;} }'
find . -type f \( -iname \*.dat -o -iname \*.dati \) -exec awk '{if(NF > 1 && ($2 < 0 || $2 > 1.0)) {print("\nTransmission (second column) should be in the closed interval [0.0, 1.0]"); print "Offending file, line number, and line content:", ARGV[1], NR, $2; exit 1}}' {} \; 
find . -type f \( -iname \*.dat -o -iname \*.dati \) -exec awk '{if(NR==1) firstline=$0;} END{if(NR-1 != firstline) {print("\nThe first line should contain the total number of filter data lines present in the file"); print ARGV[1], firstline,NR-1 ; exit 1;}}' {} \;
