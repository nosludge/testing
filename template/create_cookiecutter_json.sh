#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

# shellcheck disable=SC3040
set -eu

#######################################
#
# Create cookiecutter.json file.
#
# This code will create a proper file,
# which is (usually) created
# in GH Actions.
#
# See .github/actions/template-setup/action.yml
#
# Args:
#   Pairs of key and value.
#   Should provide an even number of arguments.
#   WARNING: Arguments count is not verified
#
#######################################

cat << _EOT_ > "${1}"
{
$(
shift
for _ in $(seq 1 2 $#); do
  echo "    \"${1}\": ${2},"
  shift 2
done)
    "_copy_without_render": [
        ".github/actions",
        ".github/workflows",
        ".git",
        "template",
        "cliff.toml"
    ]
}
_EOT_
