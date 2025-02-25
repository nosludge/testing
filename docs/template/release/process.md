# Release Process

To release a new version, [create a GitHub release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release).
This triggers all necessary pipelines.

> [!note]
> Specify a new tag version and release title.
> See the __Versioning__ section below for details.

> [!important]
> GitHub releases must be created manually. Merging to `main` __does not__
> trigger package or documentation releases.

## Versioning

This project uses a __double versioning__ scheme based on [Semantic Versioning](https://semver.org/):

- __Public version__ – The official release version (e.g., `1.2.0`).
- __Python version__ – Automatically generated from commits and independent of the public version.

### Why?

Public versions are there to signify the release to the audience
(mainly for marketing purposes), while the Python
version ensures semantic consistency (needed by package users).
This approach also enhances security by preventing automated
`tag` pushes to `main` (no `bot` automerges).

### Public Version

Public releases follow [Semantic Versioning](https://semver.org/) and trigger:

- Package release to `PyPI` (__for public repositories__, versioned by Python version).
- Documentation updates.
- Artifact generation (e.g., SBOMs).

> [!important]
> GitHub releases must be created manually to trigger pipelines.

### Python Version

Managed automatically based on commit messages:

- `fix` → Patch version update
- `feat` → Minor version update
- `BREAKING` (or `feat!`/`fix!`) → Major version update

> [!tip]
> Check out [commition](https://github.com/opennudge/commition) for Python version calculations.

## Artifacts

Releases include multiple artifacts:

- __Python package__ ([packaging guide](https://packaging.python.org/en/latest/tutorials/packaging-projects/))
- `CHANGELOG.md` (full changelog)
- `LICENSE.md` (project license)
- Documentation (uploaded to `gh-pages`)
- [OSV-Scanner SARIF](https://google.github.io/osv-scanner/output/#sarif)
- __Software Bills of Materials (SBOMs)__ ([CISA guide](https://www.cisa.gov/sbom)):
  - Python package (via [CycloneDX](https://github.com/CycloneDX/cyclonedx-python))
  - Python dependencies (via [CycloneDX](https://github.com/CycloneDX/cyclonedx-python))
  - GitHub SBOM ([docs](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/exporting-a-software-bill-of-materials-for-your-repository))
  - REUSE SBOM ([docs](https://reuse.readthedocs.io/en/stable/man/reuse-spdx.html))
- SBOM attestations ([actions/attest-sbom](https://github.com/actions/attest-sbom))
- __Python package attestations__ ([PyPI guide](https://blog.pypi.org/posts/2024-11-14-pypi-now-supports-digital-attestations/))
- __SLSA Build Provenance__ ([SLSA spec](https://slsa.dev/spec/v1.0/provenance))

> [!important]
> Some artifacts depend on repository visibility.

> [!note]
> Python package SBOMs attests hashes of `RECORD` files of each dependency, see
> [here](https://packaging.python.org/en/latest/specifications/recording-installed-packages/#the-record-file)
> for more information

## Repository Visibility & Compliance

| Visibility  | Artifacts Produced | Compliance Level |
|------------|-------------------|----------------|
| __Public__ | All artifacts | [SLSA Level 3](https://slsa.dev/spec/v1.0/levels) |
| __Enterprise__ | No provenance, private attestations | [SLSA Level 3](https://slsa.dev/spec/v1.0/levels) |
| __Private__ | No attestations, limited artifacts | [SLSA Level 2](https://slsa.dev/spec/v1.0/levels) |

## Changelog

Generated via [git-cliff](https://github.com/orhun/git-cliff)
(configured in `pyproject.toml`).

- The latest version’s changelog becomes the release description.
- Full `CHANGELOG.md` is attached to the release
- In repository `CHANGELOG.md` links to GitHub releases

The changelog includes:

- Public version, date, and comparison link
- Commit statistics (e.g., how many commits done by human vs bots,
    types of commit like security, tests, legal etc.)
- Python changes (Breaking, Features, Fixes, Bots)
- Other changes (same structure as Python changes)
- Each commit includes message, author, and metadata (if available)

> [!tip]
> Read more about changelogs in the [FAQ](faq.md#why-is-changelogmd-empty).

## Customization

This process can be adjusted via:

- `.github/workflows/release.yml`
- `pyproject.toml`:
  - `[tool.git-cliff]` – Changelog settings
  - `[dependency-groups]` → `dev-security` – changing SBOM dependencies

> [!important]
> Due to pipeline complexity, fine-tuning is more challenging.

## Code Sources

- [`.github/workflows/release.yml`]
- [`pyproject.toml`]
