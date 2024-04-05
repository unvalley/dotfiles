function is_installed
    command -v $argv[1] >/dev/null
end

abbr -a c 'bat'
abbr -a cat 'bat'
abbr -a g 'rg'
abbr -a z 'zellij'
abbr -a zel 'zellij'
abbr -a e 'exa --icons --git'
abbr -a l 'clear; and ls'
abbr -a ls 'exa --icons --git'
abbr -a ea 'exa -a --icons --git'
abbr -a la 'exa -a --icons --git'
abbr -a ee 'exa -aahl --icons --git'
abbr -a ll 'exa -aahl --icons --git'
abbr -a et 'exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
abbr -a lt 'exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
abbr -a eta 'exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
abbr -a t 'exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
abbr -a lta 'exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
abbr -a rm 'trash-put'
abbr -a n 'date "+%Y-%m-%d %H:%M:%S" | pbcopy'
abbr -a f 'fzf'

# Rust
abbr -a car 'cargo'

# Git
abbr -a g 'git'
abbr -a gi 'git init'
abbr -a ga 'git add'
abbr -a gaa 'git add .'
abbr -a gaaa 'git add -A'
abbr -a gb 'git branch'
abbr -a gc 'git commit'
abbr -a gcm 'git commit -m'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gdh 'git diff HEAD'
abbr -a gl 'git log'
abbr -a glg 'git log --graph --oneline --decorate --all'
abbr -a gld 'git log --pretty=format:"%h %ad %s" --date=short --all'
abbr -a gm 'git merge --no-ff'
abbr -a gpl 'git pull origin'
abbr -a gpo 'git push origin'
abbr -a gst 'git status'
abbr -a gss 'git status -s'
abbr -a tasks 'gh issue list --repo unvalley/projects'
