default:
    just --list

setup-brewfile:
    brew bundle --file=Brewfile

setup-chezmoi:
    chezmoi init https://github.com/unvalley/dotfiles.git
    chezmoi cd && chezmoi apply

setup-fish:
    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    chsh -s /opt/homebrew/bin/fish

setup-macos:
    sudo defaults write -g ApplePressAndHoldEnabled -bool true
	sudo defaults write com.apple.finder CreateDesktop -boolean false;killAll Finder

setup-git-config:
    sh -c 'git config --global user.name "unvalley"'
    sh -c 'git config --global user.email "kirohi.code@gmail.com"'

setup-github:
    gh auth login

# Setup gh (GitHub CLI) extensions
setup-gh-extensions:
    gh extension install seachicken/gh-poi
    gh extension install dlvhdr/gh-dash

setup-screenshot:
    mkdir ~/Pictures/ScreenShot
    defaults write com.apple.screencapture location ~/Pictures/ScreenShot/;killall SystemUIServer

# Enable key-repeating for Vim Plugin
setup-vscode:
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Setup Rust with rustup-init
setup-rust:
    rustup-init
    rustc -v

# Setup Node.js with Volta
setup-nodejs:
    volta install node
    node -v

# Shows all installed formulae that are not dependencies of any other installed formula
show-deletable-formula:
    brew list | xargs -I{} sh -c 'brew uses --installed --formula {} | wc -l | xargs printf "%20s is used by %2d formulae.\n" {}' | grep '0 formula'
