#!/bin/bash

input_dir="$1"
output_dir="$2"
new_name() {
    local original_name="$1"
    local name="${original_name%.*}"
    local ext="${original_name##*.}"
    local n_name="$original_name"
    local count=1
    while [ -e "$output_dir/$n_name" ]; do
        n_name="${name}_${count}.${ext}"
        ((count++))
    done
    echo "$new_name"
}
find "$input_dir" -type f -print0 | while IFS= read -r -d '' file; do
    file_name=$(basename "$file")
    unique_name=$(new_name "$file_name")
    cp "$file" "$output_dir/$unique_name"
done