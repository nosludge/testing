#!/usr/bin/env sh

# Ensure at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <X> <Y> [directory]"
    exit 1
fi

X="$1"
Y="$2"
DIRECTORY="${3:-./workflows}"

for file in "${DIRECTORY}"/*.yml; do
    [ -f "$file" ] || continue  # Skip if no files match

    awk -v x="$X" -v y="$Y" '
    {
        gsub("uses: \./\.github/actions/" x, "uses: \./\.github/actions/" y);
        print;
    }' "$file" > "${file}.tmp"

    # Compare original and modified file, only replace if different
    if ! cmp -s "$file" "${file}.tmp"; then
        mv "${file}.tmp" "$file"
        printf 'Updated: %s' "$file"
    else
        rm "${file}.tmp"
    fi

done
