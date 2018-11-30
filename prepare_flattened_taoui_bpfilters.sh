#!/bin/bash
rm -rf bpfilters
mkdir bpfilters
cp -r bandpass_filters/* bpfilters
cat filters_and_md5sum.txt | sed -e"s|^.* \.|cp \.|g" > tmpray1.txt
cat filters_and_md5sum.txt | sed -e"s|/|_|g" | sed -e"s|_bandpass_filters_|/bpfilters/|g" | sed -e"s|^.* \.| \.|g" > tmpray2.txt
paste tmpray1.txt tmpray2.txt > tmpray3_update_ui.sh
chmod +x tmpray3_update_ui.sh
./tmpray3_update_ui.sh
