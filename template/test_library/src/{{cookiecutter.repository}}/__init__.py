# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

"""Dummy test library used to test the template library."""

from importlib.metadata import version

from . import dummy
from ._version import __version__
from ._bar import concatenate

__version__ = version("{{ cookiecutter.repository }}")
"""Current {{ cookiecutter.repository }} version."""

del version

__all__: typing.List[str] = [
    "__version__",
    "dummy",
    "concatenate",
]
