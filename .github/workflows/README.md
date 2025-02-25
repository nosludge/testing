# GitHub Actions

[GitHub Actions](https://github.com/features/actions) are used to run
CI/CD pipelines.

> [!important]
> No pipeline modifies the repository contents (e.g. no formatting is done),
> it only verifies the compliance (e.g. linting) of source code.

## Pipelines

> [!note]
> Configuration is stored in `.github` directory and `.github/workflows` specifically

Pipelines run approximately the same steps as `pre-commit` hooks, hence
the specific functionality is located in various other documents like [legal](legal.md),
[python](python.md), [other languages](other_languages.md), [prose](prose.md),
etc.

Features of note include:

- each workflow starts with a semantic prefix defining its purpose (e.g. `tests`, `security`, `docs`)

- most of the workflows from each semantic group comes in three flavors:

  - `<type>.yml` - analogous to check/linter of `type`, done for every push to
    the pull request (usually ran __only if files of interest where changed__
    in the pull request, e.g. `**.md` files for `markdown.yml`
  - `<type>-renovate.yml` - checks ran, when `renovate[bot]` makes an update
    to the checkers (e.g. `dev-markdown` in `pyproject.toml`'s `[dependency-groups]`
    get updated, the markdown checks run on all `markdown` files in the repository).
    This allows to verify updates to the tools against currently accepted
    standards (e.g. no new checks were introduced without feedback)
  - `<type>-reusable.yml` - de facto implementation of the linter,
    will be called by `<type>.yml` and `<type>-renovate.yml`

- `*-update.yml` workflows are ran periodically, see [scheduled jobs documentation](<>)

> [!NOTE]
> This structure may not be present in all workflows, as some checks
> should not be ran on every push or renovate update, in these cases only
> `<type>.yml` might be present.

## Reusable workflows

[Reusable workflows](https://docs.github.com/en/actions/sharing-automations/reusing-workflows)
are used throughout the repository to:

- Improve security (as the source code is not modifiable
  by the repository owner)
- Streamline updates from the main template (as the reusable
  workflows are updated from the `opennudge/pynudge` repository)

You may want to change the reusable workflows to local workflows
if you want to have:

- more control over the pipeline
- you find your organization more secure and trustworth and would like
  to host the pipeline yourself
- you do not want the pipelines to change behavior without your consent

If so, check the [configuration](#configuration) section.

## Special workflows

These workflows might be of special interest:

- `pdm-reusable.yml` - runs __most of the checks__ defined in `<type>.yml`
  as a sort of centralized runner
- `security-*` - ran on PRs and periodically to ensure the security of the project,
  see [security](security.md) section for more details

## Caching

Centralized caching (create from `main` branch) is used for all workflows,
after PR merge, the cache is updated (if needed) and stored.

<!--- pyml disable-num-lines 6 no-blanks-blockquote -->

> [!NOTE]
> Cache is optimized on a per-workflow basis, each
> having a minimal set of necessary dependencies.

> [!TIP]
> For source code check [`cache.yml`](https://github.com/%7B%7Bcookiecutter.repository_owner%7D%7D/%7B%7Bcookiecutter.repository%7D%7D/blob/.github/workflows/cache.yml)

## Configuration

> [!important]
> Many of the features __can__ be controlled via `pyproject.toml` as described
> in [configuration](#configuration) section.

### Changing workflows reusability

There are two scripts provided in `.github/workflows/reusability`:

- `localize.sh` - changes the reusable workflows
  (pointing to `opennudge/pynudge`) to local workflows
- `globalize.sh` - changes the local workflows to reusable workflows
  (pointing to `opennudge/pynudge`)

Simply run `./reusability/localize.sh` or `./reusability/globalize.sh` to
apply the changes. The script also allows to specify the directory
where the changes should be applied as an argument.

> [!caution]
> While `localize.sh` is safe to run, `globalize.sh` should be used with
> caution, as it may incorrectly `globalize` workflows/actions local you have
> added on top of the template provided funcionality.
