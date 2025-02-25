# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

"""Dummy module used to test the template library."""

import dataclasses

@dataclasses.dataclass
class Dummy:
    """Dummy class used to test the template library.

    Attributes:
        name: The name of the instance.
        age: The age of the instance.

    """
    name: str
    age: int

    def __str__(self) -> str:
        """Return the string representation of the instance.

        Returns:
            The string representation of the instance.

        """
        return f"{self.name} is {self.age} years old."


def foo(a: int, b: int) -> int:
    """Dummy function used to test the template library.

    Args:
        a: The first number.
        b: The second number.

    Returns:
        The sum of the two numbers.

    """
    return a + b
