unvalley's dotfiles managed with chezmoi.

| Tool             | Name                                      |
| ---------------- | ----------------------------------------- |
| dotfiles manager | [chezmoi](https://chezmoi.io)             |
| Terminal         | [Wezterm](https://github.com/wez/wezterm) |
| Shell            | [fish](https://fishshell.com)             |

Files names prefix is added by chezmoi. See
[chezmoi Design](https://www.chezmoi.io/user-guide/frequently-asked-questions/design/).

NeoVim settings are based on [NvChad](https://github.com/NvChad/NvChad).

## TODO:

- fix install (just, Homebrew)
- devcontainer for VSCode
- replace Homebrew to Nix
- add language configs (.prettierrc, .eslintrc.json,...)
- consider ssh keys and Bitwarden using chezmoi template
- fzf for ssh


## Setup

1. Install Vivaldi browser manually
2. Install Google IME manaually (if it's ventura, you might need to install beta version)
3. Clone this repository on user directory (/Users/${username})
4. Install command

    - make install
    - make setup



## Must Items

- Wezterm
- Raycast
- NeoVim & VSCode
- Vivaldi
- Bitwarden (Chrome Extension)

## Chrome Extension

- Vimium
- TabX
- Google Black Menu
- DarkReader
- BlockSite
- AutoPagerizer
- SearchPreview
- GitHub Octotree
- GitHub Hovercard


## VSCode

- [Visual Studio Code の設定を、他のPCと同期する](https://zenn.dev/longbridge/articles/0811abc01d10cc)
    - Settings Sync

## GitHub TFA

- [Githubの2段階認証を実施してgitコマンドが使えないときにやったこと](https://qiita.com/n_morioka/items/650d2950f527d594a00f)


## GitHub local setup
- set up global .gitconfig
- create a new SSH key
- connect github through SSH
    - `git config --global url.https://unvalley:{NEW_ACCESS_TOKEN}@github.com/.insteadOf https://github.com/` 


Thanks for all dependencies.
