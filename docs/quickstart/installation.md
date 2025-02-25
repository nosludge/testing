# Installation

## Prerequisites

Before starting, install the following on your local machine:

1. [Python](https://www.python.org/downloads/) (latest version recommended).
2. [`pdm`](https://pdm-project.org/en/latest/#recommended-installation-method) package manager.

> [!note]
> Learn more about `pdm` in the [pdm documentation](https://pdm-project.org/en/latest/)

## Setup

1. Create a new GitHub repository using this template (`Use this template` button).
2. Name your repo (__use underscores `_` instead of hyphens `-`__).
3. Add a project description (__required!__).
4. __Wait for the setup commit__ (done by `github-actions[bot]`, may take a few minutes).

Once complete, clone the repository and run `pdm setup`
to install dependencies and set up the project.

## Hardening

After setup, an issue will be created outlining security hardening steps.

> [!warning]
> Following these steps is __strongly recommended__ for better security.

### Hardening Steps

- Enable third-party bots (if applicable).
- Create a short-lived, minimally scoped `TEMPLATE_GITHUB_TOKEN`.
- Run the hardening workflow.
- Set up [trusted PyPI publishing](https://docs.pypi.org/trusted-publishers/).

> [!note]
> Full automation is not currently possible due to platform limitations.

### Benefits

- Improved security following [OSSF Scorecard best practices](https://securityscorecards.dev/#the-checks).
- Enabled GitHub Pages for documentation hosting.
- Applied [GitHub rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets).
- Configured pull request defaults and other repository settings.
- Activated GitHub security features (e.g., [private vulnerability reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability)).

> [!warning]
> Exact features depend on repository type: `public` > `enterprise` > `private`.

## Code Sources

- [`template_setup.yml`](/.github/workflows/template_setup.yml)
- [`harden.yml`](/.github/workflows/harden.yml)
- [`rulesets`](/.github/rulesets)
