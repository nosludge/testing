# Tests

This document outlines the testing process of `pynudge`-based projects.

## Features

- Uses [`pytest`](https://github.com/pytest-dev/pytest) for testing.
- Measures test coverage with [`pytest-cov`](https://github.com/pytest-dev/pytest-cov)
    (default threshold: `100%`).
- __Local testing:__ Runs on the latest three Python versions,
    following [SPEC 0](https://scientific-python.org/specs/spec-0000/).
- __CI testing:__ Runs across multiple Python versions and
    OSs (Linux, macOS, Windows) via GitHub Actions.
- __Randomized test execution__ ensures independence.
- Includes [`Hypothesis`](https://github.com/HypothesisWorks/hypothesis)
    for property-based testing.

> [!note]
> `tox` is not used; instead, tests are run with different interpreters
> locally and across CI runners.

## Writing Tests

- All tests are in the `tests` directory, named `test_.py`.
- Tests should follow `pytest` style.
- __Recommended:__ Use [`Hypothesis`](https://github.com/HypothesisWorks/hypothesis)
    for property-based testing, as required
    by [OSSF Scorecard](https://github.com/ossf/scorecard).

> [!tip]
> `pynudge` does not enforce a specific testing style,
> but methodologies like TDD/BDD may be beneficial.

## Checks & Fixes

Tests should be documented, formatted, and typed as they will be checked like
regular source code.

> [!tip]
> See the [Python]() section for more information.

## Adjustments

- To change coverage requirements, update the `--cov-fail-under`
flag in `[tool.pdm.scripts]` (changes CI threshold as well).

## Code Sources

- `pyproject.toml`
- `.github/workflows/tests_.yml`
