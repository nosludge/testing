# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

"""testing official documentation."""

from __future__ import annotations

from importlib.metadata import version

__version__ = version("testing")
"""Current testing version."""

del version

__all__: list[str] = [
    "__version__",
]
