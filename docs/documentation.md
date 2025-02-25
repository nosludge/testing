# Documentation Guide

This guide outlines the documentation features included in the template for your Python package.

## Features

The template uses [`mkdocs`](https://github.com/mkdocs/mkdocs)
    with various plugins for enhanced functionality:

    - __Automated Docs__ – Generates documentation from
        `docstrings` and `/docs` using
        [`mkdocstrings`](https://github.com/mkdocstrings/mkdocstrings).
    - __Modern Design__ – Uses [`mkdocs-material`](https://github.com/squidfunk/mkdocs-material)
        for a polished look.
    - __Auto Navigation__ – [`mkdocs-awesome-pages-plugin`](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin)
        builds the navigation structure.
    - __Predefined Sections__ – `docs` includes structured folders
        (only included if populated).
    - __Versioning Support__ – [`mike`](https://github.com/jimporter/mike)
        manages documentation versions.
    - __GitHub Alerts__ – Use [GitHub Alerts](https://github.blog/changelog/2023-12-14-new-markdown-extension-alerts-provide-distinctive-styling-for-significant-content/)
        for important notes (works in docs and docstrings!).

> [!tip]
> See `mkdocs.yml` for a full list of features.

## Checks and Fixers

- Uses the same checks as in
    [prose.md](prose.md#checks-and-fixers) (excluding auto-generated docstrings).
- Runs a documentation build as a smoke test during commits.
- Ensures `docstrings` coverage via
    [`interrogate`](https://github.com/econchick/interrogate) (default: 100%).
- Detects common misspellings using
    [`codespell`](https://github.com/codespell-project/codespell).

> [!important]
> Always review generated documentation manually before pushing changes.

## Writing Docstrings

- __Document every function, class, and module__ in your package.
- Follow [Google’s docstring style](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings)
    for consistency.

## Adjustments

Common places to modify documentation settings:

- __`pyproject.toml`__ – Configure plugins and tools in
    `[dependency-groups]` (`dev-docs`).
- __`mkdocs.yml`__ – General documentation settings.
- __`docs/`__ – Add or modify content (not auto-generated).
- __`/src` docstrings__ – For API documentation.
- __Top-level `*.md` files__ – General project documentation
    (see `nav` in `mkdocs.yml`).

> [!caution]
> `README.md` in `/docs` serves as the documentation description,
> not the project overview.

## Code Sources

- `mkdocs.yml`
- `pyproject.toml`
- `docs/`
- `docs/gen_ref_pages.py`
