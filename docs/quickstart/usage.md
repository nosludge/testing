# Usage

## Prerequisites

> [!warning]
> Follow the [installation instructions](installation.md) before proceeding.

## Overview

1. Create an issue for the task.
2. Create a new branch (`<issue-number>` or similar).
3. (Optional) Add dependencies to `pyproject.toml`.
4. Write code in `/src/<project_name>` and tests in `/tests`.
5. Use `git add`, `git commit` (following [semver](https://semver.org/)), and `git push`.
6. __`pre-commit` will guide you through the process.__
7. Create a pull request (following [semver](https://semver.org/)).
8. Wait for CI checks and code review approval.

> [!tip]
> See [CONTRIBUTING.md](/CONTRIBUTING.md) for details.

## Git workflow

`pynudge` follows an extended [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow):

1. Create or pick up an issue (task tracker).
2. Create a branch (`<issue-number>` or similar) to track changes.
3. Push your changes to the remote repository.
4. Open a pull request (PR title should follow [semver](https://semver.org/),
    e.g., `feat: add feature`, `fix: bugfix`).

The `main` branch is protected and should always be in a releasable state.

> [!note]
> If a PR has multiple commits, its type should match the most significant
> commit (`feat!` > `fix!` > `feat` > `fix`).

> [!tip]
> The [`GitHub CLI`](https://cli.github.com/) simplifies this process.
> __A future extension will streamline it further.__

## Programming

### Source Code

Place project source code in `src/<project_name>` or at least
`src` (e.g., `src/infrastructure`).
Some exceptions apply (e.g., `Dockerfile`, `Makefile`).

> [!note]
> Code quality is enforced via tools configured in `pyproject.toml`
> and automatically run by [pre-commit](https://pre-commit.com/).

### Tests

Tests should be in `/tests`. The default framework is `pytest`, but
you can change it in `dev-test` inside `pyproject.toml`.

Key considerations:

- `100%` test coverage is set by default (recommended).
- Fuzzing is encouraged ([OSSF Scorecard](https://github.com/ossf/scorecard/blob/main/docs/checks.md#fuzzing));
  [`hypothesis`](https://hypothesis.readthedocs.io/en/latest/) is included.

> [!note]
> `pynudge` does not enforce a specific testing methodology (e.g., TDD, BDD).

## Commits

`pynudge` follows simplified [semver](https://semver.org/):

- Allowed types: `fix`, `feat`, `BREAKING CHANGE`.
- No scopes (e.g., `feat(actions): ...` is incorrect).

Commits should be:

- `Signed-off` (agreeing to the [Developer Certificate of Origin](https://developercertificate.org/)).
- Signed via GPG, SSH, S/MIME, or [`gitsign`](https://github.com/sigstore/gitsign)
    ([learn more](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)).

## Pull Requests

PR type is determined by the most significant commit:

- `BREAKING CHANGE` > `feat` > `fix`.
- PR labels determine scope automatically (or can be set manually).

> [!warning]
> Predefined labels exist; avoid creating new ones unless necessary.

Each PR undergoes CI testing (similar to local tests).
Depending on repository type and security settings, up to two reviewers
may be required.

## Code Sources

- [`pyproject.toml`](/pyproject.toml)
- [`.pre-commit-config.yaml`](/.pre-commit-config.yaml)
- [`pr-labeler.yml`](/.github/pr-labeler.yml)
- [`template_setup.yml`](/.github/workflows/template_setup.yml)
- [`python-tests.yml`](/.github/workflows/python-tests.yml)
