# Security

This document outlines security practices in the template.

> [!note]
> See [installation/hardening](installation.md#hardening)
> for additional security measures.

## Checks

Key security checks include:

- __Commit validation:__ Enforced signature and DCO sign-off
    ([`siderolabs/conform`](https://github.com/siderolabs/conform))
- __Branch protection:__ No direct commits to `main`
    ([`pre-commit/pre-commit-hooks`](https://github.com/pre-commit/pre-commit-hooks))
- __Vulnerability scanning:__ [`google/osv-scanner`](https://github.com/google/osv-scanner)
- __Secret scanning:__ [`trufflesecurity/trufflehog`](https://github.com/trufflesecurity/trufflehog)
- __Language-specific security checks:__

  - [`zizmor`](https://github.com/woodruffw/zizmor) for GitHub Actions security
  - [`semgrep/semgrep`](https://github.com/semgrep/semgrep) for Python/general

- __Pinned dependencies:__ [OSSF Scorecard](https://github.com/ossf/scorecard/blob/main/docs/checks.md#pinned-dependencies)

> [!important]
> These checks run both locally (`pre-commit`) and in CI/CD.

> [!tip]
> Configuration is primarily in `pyproject.toml` and `.pre-commit-config.yaml`,
> with a few additional settings in `.github/workflows`.

## GitHub Actions

> [!important]
> See [GitHub Actions documentation]() for details.

Additional security measures:

- __Automated dependency updates:__ [`renovatebot/renovate`](https://github.com/renovatebot/renovate)
- __Minimal permissions__ for GitHub Actions
- __Software Bill of Materials (SBOMs):__ Generated, stored, and attested in releases
- __Reusable workflows__ for key tasks (e.g., `release`, `test`) to minimize misconfiguration risks
    ([more info](https://github.blog/security/supply-chain-security/slsa-3-compliance-with-github-actions/))
- __Egress monitoring:__ [`stepsecurity/harden-runner`](https://github.com/step-security/harden-runner)
- __Static analysis:__ [`actionlint`](https://github.com/rhysd/actionlint)

> [!important]
> Security checks (e.g., `scorecard`) run __weekly__.

## Security Documents

> [!tip]
> Review these documents and adapt them to your project.

Following [OpenSSF best practices](https://www.bestpractices.dev/en):

- __Security policy:__ [`SECURITY.md`](https://github.com/ossf/scorecard/blob/main/docs/checks.md#security-policy)
- __Machine-readable security insights:__ [`SECURITY-INSIGHTS.yml`](https://github.com/ossf/security-insights-spec)
- __Third-party dependency policy:__ [`SECURITY-DEPENDENCY.md`]()
- __Self-assessment report:__ [`SECURITY-SELF-ASSESSMENT.md`](),
    per [CNCF guidelines](https://tag-security.cncf.io/community/assessments/guide/self-assessment/#non-goals)
- __Changelog:__ [`CHANGELOG.md`](),
    linking to GitHub releases ([FAQ](faq.md#changelog))

> [!important]
> See the full [OpenSSF Scorecard checklist](https://github.com/ossf/scorecard/blob/main/docs/checks.md).

## Adjustments

Most security configurations (e.g., `check-security`, `check-workflow`) are in `pyproject.toml`.
Additional security workflows are in `.github/workflows` (prefix: `security-`).

### OSV Scanner

To ignore specific vulnerabilities, modify `osv-scanner.toml` ([docs](https://google.github.io/osv-scanner/configuration/)).

> [!warning]
> License-related issues in __currently defined__ development dependencies
> are ignored by default.

> [!tip]
> `osv-scanner.toml` settings are respected by OSSF Scorecard.

### Conform

[`siderolabs/conform`](https://github.com/siderolabs/conform) enforces
DCO sign-off and GPG signatures. Modify `.conform.yml` to adjust checks.

## Additional Resources

- [Threat Modeling Manifesto](https://www.threatmodelingmanifesto.org/)
- [CNCF Tag Security](https://tag-security.cncf.io/)
- [AppSec Tools](https://www.jit.io/resources/appsec-tools)
