# unvalley's dotfiles

Personal macOS dotfiles managed with [chezmoi](https://chezmoi.io).

## Stack

| Role             | Tool                                                        |
| ---------------- | ----------------------------------------------------------- |
| Dotfiles manager | [chezmoi](https://chezmoi.io)                               |
| Terminal         | [WezTerm](https://github.com/wez/wezterm)                   |
| Shell            | [fish](https://fishshell.com)                               |
| Prompt           | [starship](https://starship.rs)                             |
| Multiplexer      | [Zellij](https://zellij.dev)                                |
| Editors          | [VS Code](https://code.visualstudio.com), [Zed](https://zed.dev) |
| Git pager        | [delta](https://github.com/dandavison/delta)                |

## Setup

1. Install [Homebrew](https://brew.sh/)
2. Clone this repository (`unvalley/dotfiles`) under `$HOME`
3. Run the recipes in [`justfile`](./justfile) — start with `just setup-brewfile` and `just setup-chezmoi`

See `just --list` for all available setup commands.

## Structure

- `dot_config/` — CLI tool configs (git, fish, starship, wezterm, zellij, zed, gh, gitui)
- `private_Library/` — macOS app support (Ghostty config)
- `dot_cargo/`, `dot_codex/` — language toolchain configs
- `browser_extensions/` — userscripts / userstyles
- `dictionary/` — IME dictionaries
