#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

#######################################
#
# Check the status of the workflow.
#
# Will check the status of the workflow
# based on the name of the file as such
# feature is not available in the CLI
# directly.
#
# See .github/workflows/template-test.yml
#
# Args:
#   REPOSITORY:
#       Repository to check.
#   WORKFLOW_FILE:
#       Workflow file to check.
#   MAX_ATTEMPTS:
#       Maximum attempts during
#       obtaining ID.
#   WAIT:
#       Time to wait between attempts
#       (in seconds, default: 1)
#
#######################################

# shellcheck disable=SC3040
set -eu

REPOSITORY="$1"
WORKFLOW_FILE="$2"
MAX_ATTEMPTS="${3:-100}"
WAIT="${4:-1}"

echo "REPOSITORY: ${REPOSITORY}"
echo "WORKFLOW_FILE: ${WORKFLOW_FILE}"
echo "MAX_ATTEMPTS: ${MAX_ATTEMPTS}"
echo "WAIT: ${WAIT}"

# Obtain ID of the repository initialization
# Once it's obtained we can safely clone it to run tests
ATTEMPTS_COUNTER=0

while true;
do
  echo "Looking for Run ID of the workflow ${WORKFLOW_FILE} in ${REPOSITORY}..."
  ID="$(gh run list --repo "${REPOSITORY}" --workflow "${WORKFLOW_FILE}" --json databaseId --jq '.[0].databaseId' || echo '')"
  if [ -n "${ID}"  ]; then
    break
  fi
  if [ "${ATTEMPTS_COUNTER}" -eq "${MAX_ATTEMPTS}" ]; then
    echo "Max attempts (${MAX_ATTEMPTS}) reached. Exiting..."
    exit 1
  fi

  echo "Attempt ${ATTEMPTS_COUNTER} of ${MAX_ATTEMPTS}"
  ATTEMPTS_COUNTER=$((ATTEMPTS_COUNTER+1))

  sleep "${WAIT}"
done

echo "Run ID of the workflow ${WORKFLOW_FILE} in ${REPOSITORY} is ${ID}"
echo "Waiting for the workflow run to finish successfully..."
gh run --repo "${REPOSITORY}" watch --exit-status -i 10 "${ID}" >/dev/null
