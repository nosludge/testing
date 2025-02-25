# Other languages

> [!important]
> Although these checks are about other languages, the tooling
> is largely Python-based, and the configuration is in the `pyproject.toml`

Except Python a few other "complementary" languages (mostly markup)
are verified by both `pre-commit` and CI pipelines, namely:

- `yaml` - reponsible for GitHub Actions workflows, `mkdocs.yml`,
    `.pre-commit-config.yaml`, performed by
    [adrienverge/yamllint](https://github.com/adrienverge/yamllint)
- `pyproject.toml` - responsible for Python project configuration,
    validated by [abravalheri/validate-pyproject](https://github.com/abravalheri/validate-pyproject)
- `json` - reponsible mainly `renovate.json`, performed by
    [pre-commit/pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks)
- `ini` responsible for `.editorconfig` and `.vale.ini`,
    performed by [danieljrmay/pyinilint](https://gitlab.com/danieljrmay/pyinilint)
- `markdown` - any `markdown` files, see [prose](prose.md) for more information)
- `CITATION.cff` - checked by
    [citation-file-format/cffconvert](https://github.com/citation-file-format/cffconvert)

As with other commands, they have `check-<language>` and
(if available) `fix-<language>` variants and follow standard
procedure as outlined in the [adjusting](adjusting.md) section.
