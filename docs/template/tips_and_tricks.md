# Tips & tricks

This guide provides useful tips for working with the `pynudge`-based projects.

## Committing

> [!important]
> You can use `git commit` normally; `pre-commit` will notify you of any issues.

`pynudge` offers additional commit options:

- `pdm run commit` – Runs `git commit` with `--signoff --gpg-sign`.
- `pdm run commit-type` – Prompts for a commit message and type (`feat`, `fix`, `feat!`, `fix!`).
- `pdm run commit-guided` – Opens an editor with commit type options.

> [!important]
> This feature may move to a separate tool in the future.

## Adding Contributor SPDX

Since `[tool.pdm.scripts]` doesn’t support `git` subcommands easily,
use the following function to add SPDX annotations:

```sh
add-contributor () {
  reuse annotate \
    --recursive \
    --fallback-dot-license \
    --contributor="$(git config get user.name) <$(git config get user.email)>" \
    --merge-copyrights
}
```

> [!note]
> Add this function to your `~/.bashrc` or `~/.zshrc` for easy access.
> [Learn more](https://www.cyberciti.biz/faq/create-permanent-bash-alias-linux-unix/)
