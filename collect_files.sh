#!/bin/bash

#!/bin/bash

input_dir="$1"
output_dir="$2"

# Функция для генерации уникального имени файла
generate_unique_name() {
    local original_name="$1"
    local counter=1
    local name="${original_name%.*}"
    local ext="${original_name##*.}"
    local new_name="$original_name"

    while [ -e "$output_dir/$new_name" ]; do
        new_name="${name}_${counter}.${ext}"
        ((counter++))
    done

    echo "$new_name"
}

# Рекурсивный обход и копирование файлов
find "$input_dir" -type f -print0 | while IFS= read -r -d '' file; do
    filename=$(basename "$file")
    unique_name=$(generate_unique_name "$filename")
    cp "$file" "$output_dir/$unique_name"
done
