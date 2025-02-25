<!--
SPDX-FileCopyrightText: © 2024 nosludge <https://github.com/nosludge>
SPDX-FileContributor: szymonmaszke <github@maszke.co>

SPDX-License-Identifier: Apache-2.0
-->

# Manual Repository Settings

> [!CAUTION]
> This issue is raised due to current limitations of the GitHub API and/or for security reasons.
__Human should review and apply all/some of the settings__ described here.

## Pre-requisites

Enable the following for all repositories:

- __[Mend Renovate Bot App for GitHub](https://github.com/marketplace/renovate)__ (automatically dependencies updates).
- __[StepSecurity Actions Security](https://github.com/apps/stepsecurity-actions-security)__ (manages GitHub Actions egress rules).

> [!NOTE]
> If [StepSecurity App](https://github.com/apps/stepsecurity-actions-security) is not installed, your code remains functional but less secure. More details [here](https://github.com/step-security/harden-runner).

## Setup

Follow these steps for best practices (as per your plan).

### Creating Personal Access Token

> [!CAUTION]
> Use the suggested scope and expiration to reduce exposure.

1. Go to [__GitHub Personal Access Token__ creation page](https://github.com/settings/personal-access-tokens/new) and create a token with:

- __Token name__: {{cookiecutter.repository}}-one-time-settings
- __Resource owner__: {{cookiecutter.repository_owner}}
- __Expiration date__: Custom ➡️ next day
- __Repository access__: Only select repositories ➡️ Select repositories ➡️ {{cookiecutter.repository_owner}}/{{cookiecutter.repository}}
- __Permissions__: Repository permissions:

    - __Administration__: Read & write (multiple operations: [`rulesets`](https://docs.github.com/en/rest/repos/rules?apiVersion=2022-11-28#create-a-repository-ruleset), [`gh-pages`](https://docs.github.com/en/rest/pages/pages?apiVersion=2022-11-28#create-a-github-pages-site), [general](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#update-a-repository), [private vulnerability reporting](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#enable-private-vulnerability-reporting-for-a-repository), [vulnerability alerts](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#enable-vulnerability-alerts), enabling discussions)
    - __Pages__: Read & write (setup `gh-pages`; [permission source](https://docs.github.com/en/rest/pages/pages?apiVersion=2022-11-28#create-a-github-pages-site))

> Click __Generate token__ and copy it.

2. Add it to repository secrets:

- Open [secrets](https://github.com/{{cookiecutter.repository_owner}}/{{cookiecutter.repository}}/settings/secrets/actions/new)
- __Name__: `TEMPLATE_GITHUB_TOKEN` (__exactly this name!__).
- __Secret__: Paste the token.

### Running the workflow

Manually run the `Harden` workflow ([click here](https://github.com/{{cookiecutter.repository_owner}}/{{cookiecutter.repository}}/actions/workflows/harden.yml)) and enter:

- __Plan type__: [Check here](https://docs.github.com/en/get-started/learning-about-github/githubs-plans) if unsure.
- __Reviewers for pull requests__: `2` (secure), `1` (common), `0` (solo devs). Read more [here](https://github.com/ossf/scorecard/blob/main/docs/checks.md#branch-protection).

### Cleanup

Remove `TEMPLATE_GITHUB_TOKEN` from [repository secrets](https://github.com/{{cookiecutter.repository_owner}}/{{cookiecutter.repository}}/settings/secrets/actions).

## PyPI Deployment

> [!CAUTION]
> __Skip if you want a private project.__ You can enable this later.

To deploy a Python package to PyPI:

1.Go to [PyPI Publishing](https://pypi.org/manage/account/publishing/).
2. Fill in:

    - __PyPI Project Name__: {{ cookiecutter.repository }}
    - __Owner__: {{ cookiecutter.repository_owner }}
    - __Repository name__: {{ cookiecutter.repository }}
    - __Workflow name__: release.yml

GitHub Actions will now deploy to PyPI on new releases.

{% if not cookiecutter.has_dependency_graph %}
## Dependency Graph

[Enable Dependency Graph manually](https://github.com/{{cookiecutter.repository_owner}}/{{cookiecutter.repository}}/settings/security_analysis). __Without it, GitHub SBOM will not appear in `Releases`__.

{% endif %}

## Organization setup

> [!TIP]
> Refer to [this guide](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file) for community health files (e.g. `funding.yml`).

## Additional resources

- [Open Source Guide](https://opensource.guide/)
- [Open Source Security Foundation Guides](https://openssf.org/resources/guides/)
