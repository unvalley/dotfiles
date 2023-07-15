set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x GIT_MERGE_AUTOEDIT no
# Do not show the fish greeting
set fish_greeting

export PATH="$PATH:$HOME/bin"

# EXSQL
set -x EXSQL_HOME ~/ghq/github.com/plaidev/exsql
export PATH="$PATH:$EXSQL_HOME/target/debug"
# set -x EXSQL_BQ_RUNNING_PROJECT PROJECT_NAME

# Rust
set -g fish_user_paths $HOME/.cargo/bin
fish_add_path ~/.rustup/toolchains/stable-x86_64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/stable-aarch64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/nightly-aarch64-apple-darwin/bin

# Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Python
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH
# pyenv init - | source

# Google Cloud SDK
# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
export CLOUDSDK_PYTHON=python3

# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
function fzf
    command fzf --height 30% --reverse --border $argv
end

# KEY_BINDINGS
function fish_user_key_bindings
    for mode in insert default visual
        fish_default_key_bindings -M $mode
        bind -M $mode \co __fzf_open --editor
        bind -M $mode \cr __fzf_reverse_isearch
        bind -M $mode \ch __fzf_reverse_isearch
        bind -M $mode \c] __ghq_repository_search
        bind -M $mode \cs __fzf_cd
    end
    fish_vi_key_bindings --no-erase
end

# Extends `cd` command to list directory contents after changing directory
function cd
    builtin cd $argv[1]
    ls -l
end

fish_add_path /usr/local/opt/mysql@5.7/bin
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; test -f /Users/unvalley/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/unvalley/.ghcup/bin $PATH # ghcup-env

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
    # starship
    starship init fish | source
    # zoxide
    zoxide init fish | source
end

set -Ux JAVA_HOME (/usr/libexec/java_home)