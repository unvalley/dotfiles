dotfilesPath := "$HOME/Users/unvalley/.local/share/chezmoi"
vscodeSettingsPath := "$HOME/Users/unvalley/Library/Application Support/Code/User"

# enabled after install fzf
default:
  @just --choose

homebrew-install:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

homebrew-apply:
  brew bundle --file '{{dotfilesPath}}/dot_config/homebrew/Brewfile'

show-all-files:
  defaults write com.apple.finder AppleShowAllFiles TRUE

xcode-install:
  xcode-select --install