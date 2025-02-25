# Legal

> [!caution]
> This document is not a legal advice. Consult a professional for legal questions.

This document outlines the legal aspects of `pynudge`.

## Compliance and fixes

### REUSE compliance

Repositories using this template follow [REUSE](https://reuse.software/) framework, meaning:

- Every file includes an [SPDX](https://spdx.dev/use/specifications/) header with
    `license` and copyright details.
- Headers are either language-specific comments or `<filename>.license`
    files when comments aren't supported.

> [!tip]
> Keeping default settings is recommended.
> Add [`SPDX-FileContributor`](https://spdx.github.io/spdx-spec/v2.2.2/file-information/#8.14) as needed.

- The `pre-commit` hook automatically adds missing headers (`fix-legal` in `pyproject.toml`).
- `check-legal` in `pyproject.toml` ensures compliance and runs after `fix-legal`.

### License compliance

[`google/osv-scanner`](https://github.com/google/osv-scanner) checks dependency licenses.
Allowed licenses (subject to change):

> MIT, Apache-2.0, BSD-2-Clause, BSD-3-Clause, Unlicense, Zlib, OFL-1.1, 0BSD, PSF-2.0

## Adjustments

### REUSE customization

To add `SPDX-FileContributor` to headers, define a bash alias and run it
manually.

> [!note]
> Pulling `contributor` fields from `git` config is not yet available
> ([issue](https://github.com/fsfe/reuse-tool/issues/1108)).

See [tips_and_tricks](tips_and_tricks.md#reuse) for recommendations.

### Modifying License Compliance

> [!important]
> Adjust project licensing as needed.

To update allowed licenses for `osv-scanner`:

- Modify `.pre-commit-config.yaml` (`id: osv-scanner`) for local changes.
- Update `.github/workflows/reusable-security-osv-scanner.yml` for CI.

## Documents

- __`LICENSE.md`__ (Apache-2.0 by default) should be a symbolic link to the
    actual license file in `licenses/`.
- __`LICENSES/`__ folder contains all project licenses
    (e.g., `pdm.lock` is [`CC0-1.0`](https://creativecommons.org/publicdomain/zero/1.0/deed.en)).
- __[`CODE_OF_CONDUCT.md`]()__ follows the [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).
- __[`DCO.md`]()__ (Developer Certificate of Origin) must remain unchanged;
    all commits must be signed off ([details](https://wiki.linuxfoundation.org/dco)).
- __[`GOVERNANCE.md`]()__ outlines project governance.
- __[`CITATION.cff`]()__ provides citation details
    ([GitHub guide](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files)).

## Code Sources

- `pyproject.toml`
- `.pre-commit-config.yaml`
- `.github/workflows/reusable-security-osv-scanner.yml`
