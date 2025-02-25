# Python

> [!important]
> For testing details, see the [tests](tests.md) documentation.

As the project's core language, `Python` undergoes the most extensive linting.

## Checks and Fixes

The following tools are used, in order:

- __Dependency analysis:__ [`FawltyDeps`](https://github.com/tweag/FawltyDeps)
    (may produce false positives; see [Adjustments](#adjustments))
- __Code formatting & linting:__ [`ruff`](https://github.com/astral-sh/ruff)
    (all checks enabled by default)
- __Spell checking:__ [`codespell`](https://github.com/codespell-project/codespell)
    (fixes common unambiguous typos)
- __Docstring coverage:__ [`interrogate`](https://github.com/econchick/interrogate)
    (checks all functions, classes, and modules, including private ones)
- __Type checking:__ [`pytype`](https://github.com/google/pytype)
    (preferred over `mypy` for its relaxed rules and better inference)

## Adjustments

Most settings can be configured in `pyproject.toml` (see [Configuration](configuration.md)).

- __Lower docstring coverage threshold:__ Adjust `fail-under`
    in `[tool.interrogate]`.
- __Handle false positives in `FawltyDeps`:__ Add dependencies to
    `ignore_undeclared` or `ignore_undefined` under `[tool.fawltydeps]`
    (__ensure correctness before ignoring__).
