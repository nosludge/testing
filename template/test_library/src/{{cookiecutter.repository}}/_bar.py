# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

"""Internal module of the dummy library."""


def concatenate(*strings: str, sep: str = " ") -> str:
    """Concatenate the given strings.

    Args:
        strings: The strings to concatenate.
        sep: The separator to use.

    Returns:
        The concatenated string.

    """
    return sep.join(strings)
