# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

"""{{ cookiecutter.repository }} official documentation."""

from __future__ import annotations

from importlib.metadata import version

__version__ = version("{{ cookiecutter.repository }}")
"""Current {{ cookiecutter.repository }} version."""

del version

__all__: list[str] = [
    "__version__",
]
