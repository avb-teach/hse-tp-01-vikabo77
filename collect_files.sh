#!/bin/bash

input_dir="$1"
output_dir="$2"

for file in "$input_dir"/*; do
    filename=$(basename "$file")
    if [ -e "$output_dir/$filename" ]; then
        counter=1
        name="${filename%.*}" 
        ext="${filename##*.}"
        while [ -e "$output_dir/${name}_${counter}.${ext}" ]; do
            counter=$((counter + 1))
        done
        new_filename="${name}_${counter}.${ext}"
    else
        new_filename="$filename"
    fi
    cp "$file" "$output_dir/$new_filename"
done