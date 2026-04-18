# Do not show the fish greeting
set fish_greeting

# ---- Environment ----
set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x GIT_MERGE_AUTOEDIT no

# ---- Project: EXSQL ----
set -x EXSQL_HOME ~/ghq/github.com/codatum/exsql
set -x EXSQL_BQ_RUNNING_PROJECT exsql-sandbox
fish_add_path $EXSQL_HOME/target/debug

# ---- Rust ----
fish_add_path ~/.rustup/toolchains/stable-x86_64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/stable-aarch64-apple-darwin/bin
fish_add_path ~/.rustup/toolchains/nightly-aarch64-apple-darwin/bin
fish_add_path $HOME/.cargo/bin

# ---- Go ----
set -x GOENV_ROOT $HOME/.goenv
fish_add_path $GOENV_ROOT/bin
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# ---- Python ----
set -x PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# ---- Node.js (Volta) ----
set -gx VOLTA_HOME "$HOME/.volta"
if test -d $VOLTA_HOME/bin
    fish_add_path $VOLTA_HOME/bin
end

# ---- AWS ----
set -gx AWS_DEFAULT_REGION ap-northeast-1

# ---- Google Cloud SDK ----
set -x CLOUDSDK_PYTHON python3

# ---- Haskell (ghcup) ----
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
if test -f $HOME/.ghcup/env
    fish_add_path $HOME/.cabal/bin $HOME/.ghcup/bin
end

# ---- fzf ----
function fzf
    command fzf --height 30% --reverse --border $argv
end

# ---- Key bindings ----
function fish_user_key_bindings
    for mode in insert default visual
        fish_default_key_bindings -M $mode
        bind -M $mode \co '__fzf_open --editor'
        bind -M $mode \cr __fzf_reverse_isearch
        bind -M $mode \ch __fzf_reverse_isearch
        bind -M $mode \c] __ghq_repository_search
        bind -M $mode \cs __fzf_cd
    end
    fish_vi_key_bindings --no-erase
end

# Extend `cd` to list directory contents after changing directory
function cd
    builtin cd $argv[1]
    ls -l
end

# ---- Interactive session ----
if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
    starship init fish | source
    zoxide init fish | source
end

function save_history --on-event fish_preexec
    history --merge
end

# ---- Theme (follow macOS light/dark) ----
# Update theme in ~/.config/zellij/config.kdl
function _change_zellij_theme -a zellij_theme
    test -n "$zellij_theme"; or return 1
    set -l config_file "$HOME/.config/zellij/config.kdl"
    test -f "$config_file"; or return 0
    command sed -i '' -E "s/^theme \"[^\"]+\"/theme \"$zellij_theme\"/" "$config_file"
end

# TODO: instant switch
function toggle_theme
    if defaults read -g AppleInterfaceStyle &>/dev/null
        set -U theme "dark"
        yes | fish_config theme save "Catppuccin Mocha"
        _change_zellij_theme "catppuccin-mocha"
    else
        set -U theme "light"
        yes | fish_config theme save "Catppuccin Latte"
        _change_zellij_theme "catppuccin-latte"
    end
end

toggle_theme
