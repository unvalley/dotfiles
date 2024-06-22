function is_installed
    command -v $argv[1] >/dev/null
end

abbr -a c 'bat'
abbr -a cat 'bat'
abbr -a z 'zellij'
abbr -a zel 'zellij'
abbr -a e 'eza --icons --git'
abbr -a l 'clear; and ls'
abbr -a ls 'eza --icons --git'
abbr -a ea 'eza -a --icons --git'
abbr -a la 'eza -a --icons --git'
abbr -a ee 'eza -aahl --icons --git'
abbr -a ll 'eza -aahl --icons --git'
abbr -a et 'eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
abbr -a lt 'eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
abbr -a eta 'eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
abbr -a t 'eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
abbr -a lta 'eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
abbr -a rm 'trash-put'
abbr -a f 'fzf'
abbr -a ps 'procs'
abbr -a che 'chezmoi'

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

# Docker
abbr -a doc 'docker'