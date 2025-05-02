#!/bin/bash

new_name() {
    local i=1
    local name="${1%.*}"
    local ext="${1##*.}"
    local new="$1"
    while [ -e "$2/$new" ]; do
        new="${name}_$((i++)).${ext}"
    done
    echo "$new"
}
input="$1"
output="$2"
find "$input" -type f -print0 | while IFS= read -r -d '' f; do
    cp "$f" "$output/$(new_name "${f##*/}" "$output)"
done