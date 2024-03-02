# Do not show the fish greeting
set fish_greeting

set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x GIT_MERGE_AUTOEDIT no

# EXSQL
set -x EXSQL_HOME ~/ghq/github.com/codatum/exsql
set -x EXSQL_BQ_RUNNING_PROJECT exsql-sandbox
# set -x GOOGLE_APPLICATION_CREDENTIALS ~/.google-cloud/service-account.json

fish_add_path $EXSQL_HOME/target/debug


# Rust
fish_add_path ~/.rustup/toolchains/stable-x86_64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/stable-aarch64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/nightly-aarch64-apple-darwin/bin
fish_add_path $HOME/.cargo/bin

# Go
set -x GOENV_ROOT $HOME/.goenv
fish_add_path $GOENV_ROOT/bin
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# Python
set -x PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

set -gx JAVA_HOME (/usr/libexec/java_home)
set -gx AWS_DEFAULT_REGION ap-northeast-1

# volta
set -gx VOLTA_HOME "$HOME/.volta"
if test -d $VOLTA_HOME/bin
	fish_add_path $VOLTA_HOME/bin
end


# Google Cloud SDK
set -x CLOUDSDK_PYTHON python3

# LLVM
#fish_add_path /opt/homebrew/opt/llvm/bin
#set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
#set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

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
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; test -f /Users/unvalley/.ghcup/env ; and fish_add_path $HOME/.cabal/bin /Users/unvalley/.ghcup/bin # ghcup-env

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
    # starship
    starship init fish | source
    # zoxide
    zoxide init fish | source
end

#set -x JAVA_HOME (/usr/libexec/java_home)
