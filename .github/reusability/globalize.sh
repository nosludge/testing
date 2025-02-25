#!/usr/bin/env sh

directory="${1:-./workflows}"

for file in "$directory"/*.yml; do
    [ -f "$file" ] || continue  # Skip if no files match

    awk '
    {
        if ($0 ~ /uses: \.\/\.github\//) {
            gsub(/uses: \.\/\.github\//, "uses: opennudge/pynudge/.github/");
            $0 = $0 "@main";
        }
        print;
    }' "$file" > "${file}.tmp"

    # Compare original and modified file, only replace if different
    if ! cmp -s "$file" "${file}.tmp"; then
        mv "${file}.tmp" "$file"
        printf 'Updated: %s\n' "$file"
    else
        rm "${file}.tmp"
    fi

done
