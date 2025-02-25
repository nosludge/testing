#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

# shellcheck disable=SC3040
set -eu

REPOSITORY="${1}"
OWNER="${2}"
NEW_REPOSITORY_NAME="${3}"
MAX_ATTEMPTS="${4:-10}"
WAIT="${5:-5}"

NEW_REPOSITORY_UUID="$(dd bs=1024 if=/dev/urandom count=1 2>/dev/null | LC_ALL=C tr -dc "[:lower:]" | head -c 20)"

echo "REPOSITORY: ${REPOSITORY}"
echo "OWNER: ${OWNER}"
echo "MAX_ATTEMPTS: ${MAX_ATTEMPTS}"
echo "WAIT: ${WAIT}"

NEW_REPOSITORY="${OWNER}/${NEW_REPOSITORY_NAME}_${NEW_REPOSITORY_UUID}"

echo "NEW_REPOSITORY (to be created): ${NEW_REPOSITORY}"

gh repo new --template "${REPOSITORY}" --private \
  --description "Temporary python-library-template testing repository" \
  "${NEW_REPOSITORY}"

# Output the new repository name to GitHub Actions
echo "repo=${NEW_REPOSITORY}" >> "${GITHUB_OUTPUT}"
echo "repo_name=${NEW_REPOSITORY_NAME}" >> "${GITHUB_OUTPUT}"
