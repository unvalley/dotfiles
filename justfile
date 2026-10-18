default:
    just --list

# --- Dotfiles ---

# Initialize chezmoi and apply dotfiles
setup-chezmoi:
    chezmoi init https://github.com/unvalley/dotfiles.git
    chezmoi cd && chezmoi apply

# --- Packages ---

# Install all Homebrew packages from Brewfile
setup-brewfile:
    brew bundle --file=Brewfile

# Show installed formulae not used by any other formula (deletion candidates)
show-deletable-formula:
    brew list | xargs -I{} sh -c 'brew uses --installed --formula {} | wc -l | xargs printf "%20s is used by %2d formulae.\n" {}' | grep '0 formula'

# --- Shell ---

# Register fish as a login shell and set it as default
setup-fish:
    sh -c 'grep -q "^/opt/homebrew/bin/fish$" /etc/shells || echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells >/dev/null'
    chsh -s /opt/homebrew/bin/fish

# --- macOS ---

# Apply macOS preferences (key-repeat, hide desktop icons, disable rcd)
setup-macos:
    sudo defaults write -g ApplePressAndHoldEnabled -bool true
    sudo defaults write com.apple.finder CreateDesktop -boolean false; killall Finder
    sudo launchctl disable gui/"$(id -u)"/com.apple.rcd
    sudo launchctl kill SIGTERM gui/"$(id -u)"/com.apple.rcd

# Save screenshots to ~/Pictures/ScreenShot
setup-screenshot:
    mkdir -p ~/Pictures/ScreenShot
    defaults write com.apple.screencapture location ~/Pictures/ScreenShot/; killall SystemUIServer

# Enable key-repeating for VS Code Vim plugin
setup-vscode:
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Apply Xcode editor prefs (Vim mode, key-repeat, line numbers, 80-col guide, Catppuccin themes)
setup-xcode:
    defaults write com.apple.dt.Xcode KeyBindingsMode -string Vim
    defaults write com.apple.dt.Xcode ApplePressAndHoldEnabled -bool false
    defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true
    defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
    defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 80
    defaults write com.apple.dt.Xcode DVTTextShowInvisibleCharacters -bool true
    defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true
    defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true
    defaults write com.apple.dt.Xcode XCFontAndColorCurrentTheme -string "Catppuccin Latte.xccolortheme"
    defaults write com.apple.dt.Xcode XCFontAndColorCurrentDarkTheme -string "Catppuccin Mocha.xccolortheme"

# --- Git / GitHub ---

# Configure global Git identity
setup-git-config:
    git config --global user.name "unvalley"
    git config --global user.email "kirohi.code@gmail.com"

# Authenticate with GitHub CLI
setup-github:
    gh auth login

# Install gh extensions (gh-poi, gh-dash)
setup-gh-extensions:
    gh extension install seachicken/gh-poi
    gh extension install dlvhdr/gh-dash

# --- Languages ---

# Install Rust toolchain via rustup
setup-rust:
    rustup-init
    rustc -v
