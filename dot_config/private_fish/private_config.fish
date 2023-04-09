set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x GIT_MERGE_AUTOEDIT no

export PATH="$PATH:$HOME/bin"

# EXSQL
set -x EXSQL_HOME ~/src/github.com/plaidev/exsql
export PATH="$PATH:$EXSQL_HOME/target/debug"
# set -x EXSQL_BQ_RUNNING_PROJECT PROJECT_NAME

# Do not show the fish greeting
set fish_greeting

# Rust
set -g fish_user_paths $HOME/.cargo/bin
fish_add_path ~/.rustup/toolchains/stable-x86_64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/stable-aarch64-apple-darwin/bin

# Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"


# Python
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH

# pyenv init - | source

# Go
#set -x GOPATH $HOME
#set -x GOROOT /usr/local/opt/go/libexec
#set -x GOPATH $HOME/.go
#set -x PATH $GOPATH/bin $GOROOT/bin $PATH

# Google Cloud SDK
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
# gsutil
export CLOUDSDK_PYTHON=python3

# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
function fzf
    command fzf --height 30% --reverse --border $argv
end

# KEY_BINDINGS
function fish_user_key_bindings
    bind \co __fzf_open --editor
    bind \cr __fzf_reverse_isearch
    bind \c] __ghq_repository_search
	# I wanna use \cb on tmux.
    # bind \cb fzf_git_recent_branch
    bind \cs __fzf_cd
end

# Extends `cd` command to list directory contents after changing directory
function cd
    builtin cd $argv[1]
    ls -l
end


fish_add_path /usr/local/opt/mysql@5.7/bin
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; test -f /Users/unvalley/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/unvalley/.ghcup/bin $PATH # ghcup-env

eval "$(/opt/homebrew/bin/brew shellenv)"

# goenv
if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
    # starship
    starship init fish | source
    # zoxide
    zoxide init fish | source
end

