setup-brewfile:
    brew bundle --file=Brewfile

setup-git-config:
    sh -c 'git config --global user.name "unvalley"'
    sh -c 'git config --global user.email "kirohi.code@gmail.com"'

setup-github:
    gh auth login

setup-fish:
    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    chsh -s /opt/homebrew/bin/fish

setup-chezmoi:
    chezmoi init https://github.com/unvalley/dotfiles.git
    chezmoi cd && chezmoi apply