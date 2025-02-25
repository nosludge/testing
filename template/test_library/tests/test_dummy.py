# SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
# SPDX-FileContributor: szymonmaszke <github@maszke.co>
#
# SPDX-License-Identifier: Apache-2.0

"""Tests for the dummy submodule."""
import hypothesis

import {{ cookiecutter.repository }}

@hypothesis.given(hypothesis.strategies.text(), hypothesis.strategies.integers())
def test_dummy(name: str, age: int) -> None:
    """Test the Dummy class.

    Args:
        name (str): The name of the dummy.
        age (int): The age of the dummy.

    """
    dummy = {{ cookiecutter.repository }}.dummy.Dummy(name, age)
    assert str(dummy) == f"{name} is {age} years old."


@hypothesis.given(hypothesis.strategies.integers(), hypothesis.strategies.integers())
def test_foo(a: int, b: int) -> None:
    """Test the foo function.

    Args:
        a: The first argument.
        b: The second argument.

    """
    assert {{ cookiecutter.repository }}.foo(a, b) == a + b

@hypothesis.given(hypothesis.strategies.lists(hypothesis.strategies.text()), hypothesis.strategies.text())
def test_bar(strings: list[str], sep: str) -> None:
    """Test the bar function.

    Args:
        strings: A list of strings.
        sep: The separator.

    """
    assert {{ cookiecutter.repository }}.bar(strings, sep) == sep.join(strings)
