# Configuration Guide

This guide covers essential adjustments to the template.

> [!important]
> Keep changes minimal to simplify updates.
> If your changes relate to a specific section, consult its
> documentation first.

## `pyproject.toml`

Most adjustments are made in `pyproject.toml`, which controls:
- __Developer Dependencies__ – Managed in `[dependency-groups]`
    (each dependency prefixed by `dev`).
- __Tool Settings__ – Configures tools like
    [`ruff`](https://docs.astral.sh/ruff/configuration/) and
    [`pytype`](https://github.com/google/pytype), section `[tool.<name-of-tool>]`.
- __Developer Commands__ – Defined under `[tool.pdm.scripts]`
    (`check-<type>` or `fix-<type>`).

> [!note]
> Sections are ordered by importance and frequency of change.

## `pre-commit`

Some tools not integrated with `pyproject.toml` can be configured via `.pre-commit-config.yaml`.

> [!tip]
> Non-`pyproject.toml` configurations are usually at the beginning of the file.

More details: [pre-commit documentation](https://pre-commit.com/#usage)

## GitHub Actions

`pynudge` minimizes manual GitHub Actions configuration, allowing
modifications through `pyproject.toml`.

To add or edit actions, modify files in `.github/workflows/`.

> **More Info:** See [GitHub Actions Guide](...).

## Other adjustments

For other modifications, check:
- Relevant documentation sections (e.g., `security`).
- [FAQ]()
- [Tips & Tricks]()

> [!important]
> __Need Help?__ Search the docs for specific files or directories.
> If you can’t find what you need, please [open an issue]().
