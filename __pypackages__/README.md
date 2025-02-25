<!--
SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
SPDX-FileContributor: szymonmaszke <github@maszke.co>

SPDX-License-Identifier: Apache-2.0
-->

# Development dependencies (PEP582)

This repository contains project dependencies
as defined by (rejected) [PEP582 specification](https://peps.python.org/pep-0582/).

This approach allows us to:

- Manage dependencies in a well-defined manner
- Install/update dependencies for all Python versions
- Keep dependencies separated (within `.git` folder instead of `venv`)
- Test without using third party tools such as `tox` or `nox`
