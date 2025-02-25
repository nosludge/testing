# Release checklist

> [!note]
> While automation handles most of the release process,
> some project-specific details require manual updates.

## README

- Update [Features](#features) with ~5 key points.
- Keep [Usage](#usage) clear and concise.
- Add [Examples](#examples):

  - Basic usage
  - Common task
  - Advanced/expert-level usage

> [!caution]
> Review `README.md` after changes to ensure accuracy.

## pyproject.toml

> [!caution]
> Do not edit sections starting with `DO NOT EDIT UNTIL end marker`
> and ending with `[[[end]]]`.

- `[project.classifiers]` – Add relevant
    [PyPI classifiers](https://pypi.org/classifiers/).
- `[project.dependencies]` & `[project.optional-dependencies]` – Double-check
    correctness.

> [!tip]
> For public projects after the first release, remove `exclude_links`
> in `[tool.md_dead_link_check]` to validate all links.

## Documentation

> [!caution]
> Adjust `/docs` structure and content as needed.

Docs are categorized into:

- [`tutorials`](./tutorials/README.md) – Hands-on learning examples
- [`guides`](./guides/README.md) – General overviews
- [`how-tos`](./how-tos/README.md) – Step-by-step solutions

> [!note]
> Content in these folders is auto-included via
> [`mkdocs-awesome-pages`](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin).

> [!caution]
> Manually validate `mkdocs.yml` and generated docs.

## Security

- Verify and update `CODEOWNERS`
    ([docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)).
- Fill in `TBD` sections in `SECURITY-SELF-ASSESSMENT.md`
    ([CNCF guide](https://tag-security.cncf.io/community/assessments/guide/self-assessment/#non-goals)).
- __Optional:__ Add more contact details to `SECURITY.md`.

## Documents

- Ensure `ROADMAP.md` outlines plans for the next release (if applicable).
