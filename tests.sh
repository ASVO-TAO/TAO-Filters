#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
list_of_filters_and_md5="filters_and_md5sum.txt"
tmpfile="junk.txt"
find . -type f \( -iname \*.dat -o -iname \*.dati \) -exec md5sum {} \; | sort -k2 > "$tmpfile"
diff -q "$list_of_filters_and_md5" "$tmpfile"
status=$?
if [ $status -ne 0 ]; then
    echo "List of filter datafiles does not agree with the expected list in '$list_of_filters_and_md5'"
    echo "Did you add a new filter or update any of the filter data in existing files?"
    diff "$list_of_filters_and_md5" "$tmpfile"
    exit $status
fi

find . -type f \( -iname \*.dat -o -iname \*.dati \) -print0 | while read -d $'\0' file
do                                                                    
    awk '{if(NR==1 && NF != 1) {print("\nFirst line should contain only the total number of lines in the filter file"); print ARGV[1], NR, $0; exit 1;}}' $file
    status=$?
    if [ $status -ne 0 ]; then
        echo "File '$file': ${red}FAILED${reset}"
        exit $status
    fi
    
    awk '{if(NR==1) firstline=$0;} END{if(NR-1 != firstline) {print("\nThe first line should contain the total number of filter data lines present in the file"); print ARGV[1], firstline, NR-1 ; exit 2;}}' $file
    status=$?
    if [ $status -ne 0 ]; then
        echo "File '$file': ${red}FAILED${reset}"
        exit $status
    fi
    
    awk '{if(NF && NR > 1 && NF != 2) {print("\nSecond line onwards should contain exactly 2 columns -- wavelength and transmission"); print "Offending file, line number, number of fields, and line content:", ARGV[1], NR, NF, $0; exit 3;}}' $file
    status=$?
    if [ $status -ne 0 ]; then
        echo "File '$file': ${red}FAILED${reset}"
        exit $status
    fi

    awk 'END{if(NR <= 3) {print("Number of lines is too small to reliably use a spline within the TAO SED module. Line content = %s\n", $0); exit 4;}}' $file
    status=$?
    if [ $status -ne 0 ]; then
        echo "File '$file': ${red}FAILED${reset}"
        exit $status
    fi

    tail -n +2 $file | sort -C -n -k1
    status=$?
    if [ $status -ne 0 ]; then
        echo "The first column (wavelength) should be sorted in increasing order"
        echo "File '$file': ${red}FAILED${reset}"
        exit 5
    fi

    awk '{if(NF > 1 && ($2 < 0 || $2 > 1.0)) {print("\nTransmission (second column) should be in the closed interval [0.0, 1.0]"); print "Offending file, line number, and line content:", ARGV[1], NR, $2; exit 6}}' $file
    status=$?
    if [ $status -ne 0 ]; then
        echo "File '$file': ${red}FAILED${reset}"
        exit $status
    fi
done
status=$?
exit $status
