dotfilesPath := "$HOME/Users/unvalley/.local/share/chezmoi"

default:
  @just --choose

homebrew-install:
  which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

homebrew-apply:
  brew bundle --file '{{dotfilesPath}}/dot_config/homebrew/Brewfile'
