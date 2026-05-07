# CLAUDE.md

Guidance for Claude Code working in this repository.

## Repository Overview

Personal macOS dotfiles managed with [chezmoi](https://chezmoi.io). Configurations live under
filenames with chezmoi prefixes (`dot_` → `.`, `private_` → 600 permissions).

## Chezmoi Workflow

- `chezmoi apply` — write changes from this repo to `$HOME`
- `chezmoi edit <target>` — edit the source file for a managed target
- `chezmoi add <path>` — start managing a new file
- `chezmoi diff` — preview what `apply` would do
- `chezmoi managed` — list what chezmoi controls

When editing files in this repo directly, run `chezmoi apply` afterward (or ask the user to) so
the changes reach `$HOME`.

## Setup

All first-time setup lives in `justfile`. Run `just --list` to see recipes
(Brewfile, fish shell, macOS defaults, Git identity, Rust/Node toolchains, etc).

## Conventions

- **Shell**: fish. Aliases/abbrs live in `dot_config/private_fish/private_conf.d/private_alias.fish`.
- **Prompt**: starship overrides any `fish_prompt` defined in this repo.
- **Terminal**: WezTerm, with Zellij multiplexer.
- **Editors**: VS Code (primary) and Zed, both with Vim mode.
- **Git**: delta pager, conventional commits via `czg`.
- **Package managers**: Homebrew (system), rustup (Rust).

## Known gotchas

- `~/.gitconfig` wins over `~/.config/git/config` per git's precedence rules.
- `core.excludesfile = ~/.gitignore` means `~/.config/git/ignore` is NOT read.
- Fisher-managed files under `private_functions/` (bass, __fzf_*, __ghq*) are owned by fisher —
  prefer updating `private_fish_plugins` rather than editing those files directly.
