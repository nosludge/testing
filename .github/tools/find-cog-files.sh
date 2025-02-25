#!/usr/bin/env sh

DIRECTORY="${1}"

find "${DIRECTORY}" -type f -exec grep -l '\[\[\[cog' {} +
