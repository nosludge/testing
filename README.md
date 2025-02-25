<!--
SPDX-FileCopyrightText: © 2025 nosludge <https://github.com/nosludge>
SPDX-FileContributor: szymonmaszke <github@maszke.co>

SPDX-License-Identifier: Apache-2.0
-->

# pynudge

<!-- vale off -->
<p align="center">
    <em>Template automating Python development</em>
</p>

<div align="center">

 <a href="https://opensource.org/licenses/Apache-2.0">![License](https://img.shields.io/badge/License-Apache_2.0-blue?style=for-the-badge)</a>
 <a>
 ![OSSF-Scorecard Score](https://img.shields.io/ossf-scorecard/github.com/nosludge/lintease?style=for-the-badge&label=OSSF)
 </a>

</div>

<p align="center">
✨ <a href="features">Features</a>
🚀 <a href="quickstart">Quickstart</a>
📚 <a href="https://opennudge.github.io/pynudge">Documentation</a>
🤝 <a href="contribute">Contribute</a>
👍 <a href="https://github.com/nosludge/lintease/blob/main/ADOPTERS.md">Adopters</a>
📜 <a href="legal">Legal</a>
</p>
<!-- vale on -->

---

## Features

__pynudge__ is a Python oriented template which provides (__with no additional setup__):

- [__Truly open source__](https://opennudge.github.io/pynudge/quickstart/usage):
    no tokens, no fees, no premium plans, open source software only
- [__Ease of use__](https://opennudge.github.io/pynudge/quickstart/usage):
    clone templated repo, run `pdm setup` and __focus on your code__
- [__Consistency__](https://opennudge.github.io/pynudge/adjusting_template):
    `pre-commit` and `GitHub Actions` share the same config (`pyproject.toml`)
- [__Security__](https://opennudge.github.io/pynudge/security):
    [SLSA](https://slsa.dev/) L3+ (public/enterprise) or L2 (private),
    [OSSF Best Practices](https://github.com/ossf/scorecard)
- [__Batteries included__](https://opennudge.github.io/pynudge/features):
    multiple checkers for Python, YAML, Markdown, prose, etc.
- [__Performance__](https://opennudge.github.io/pynudge/pipelines):
    Parallel checks, builds, minimal caches and checkouts

## Quickstart

### Installation

> [!NOTE]
> Optionally [install `pdm`](https://pdm-project.org/en/latest/#recommended-installation-method)
(if you don't have it already), for Linux/MacOS:

```sh
curl -sSL https://pdm-project.org/install-pdm.py | python3 -
```

1. Create a new GitHub repository using this template (green `Use this template` button)
2. Name your repo (__use underscore `_`, not hyphens `-`__)
3. Add project description (__necessary!__)
4. __Wait until the setup commit appears__
    (performed by `github-actions[bot]`, it may take a few minutes)
5. Clone the repository
6. Run `pdm setup` to setup development environment

### Usage

1. Create a new branch
2. Optionally add dependencies to `pyproject.toml`
3. Write code in `/src/<project_name>` and tests in `/tests`
4. Use `git add`, `git commit` and `git push` your changes
5. `pre-commit` will guide you through the process

> [!IMPORTANT]
> For more details read the [documentation](https://opennudge.github.io/pynudge)

### Examples

<details>
  <summary><b><big>Run checkers or fixers manually</big></b> (click me)</summary>
&nbsp;

```sh
> pdm check-<group> # pdm fix-<group>
```

See [groups documentation](https://opennudge.github.io/pynudge) for more details.

Note that all `check` and `fix` commands are grouped for your convenience:

```sh
> pdm check-all # pdm fix-all
```

</details>

<details>
  <summary><b><big>Adjust template</big></b> (click me)</summary>
&nbsp;

> Most of the adjustments can be done by __only editing `pyproject.toml`__

Common changes to `pyproject.toml`:

- Add dev dependencies under `[dependency-groups]`
(everything is named `dev-<group>`)
- Modify `[tool.pdm.scripts]` for custom command
(`check-<group>` or `fix-<group>`, the latter modifies files)
- Use `[tool.<name>]` for specific tool configuration (see [details]())

> __Adjusting these sections will affect `pre-commit` and `GitHub Actions`__

</details>

<details>
  <summary><b><big>Disable some pre-commit check</big></b> (click me)</summary>
&nbsp;

> Disabling checks should be done cautiously!

`pre-commit` checks are defined in `.pre-commit-config.yaml`.

Disable a check using `SKIP` environment variable:

```sh
SKIP='<group1>,<group2>` git commit -m <message>
```

For details, refer to the `id` fields in `.pre-commit-config.yaml`.

> Some commands have both `<group>-fix` and `<group>-check`
for different actions

</details>

## Contribute

We welcome your contributions! Start here:

- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Contributing Guide](CONTRIBUTING.md)
- [Roadmap](ROADMAP.md)
- [Changelog](CHANGELOG.md)
- [Report security vulnerabilities](SECURITY.md)
- [Open an Issue](https://github.com/nosludge/lintease/issues)

## Legal

- This project is licensed under the _Apache 2.0 License_ - see
  the [LICENSE](LICENSE.md) file for details.
- This project is copyrighted by _nosludge_ - see
  the [COPYRIGHT](https://github.com/nosludge/lintease/blob/main/COPYRIGHT.txt)
  file for details.
