function check_installed
    command -v $argv[1] >/dev/null
end

if check_installed bat
    alias cat 'bat'
end

if check_installed rg
    alias grep 'rg'
end

if check_installed zellij
    alias zel 'zellij'
end

if check_installed code
    alias c 'code'
end

if check_installed exa
    alias e 'exa --icons --git'
    alias l 'clear && ls'
    alias ls 'exa --icons --git'
    alias ea 'exa -a --icons --git'
    alias la 'exa -a --icons --git'
    alias ee 'exa -aahl --icons --git'
    alias ll 'exa -aahl --icons --git'
    alias et 'exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
    alias lt 'exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
    alias eta 'exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
    alias tree 'exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
    alias lta 'exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
end

if check_installed trash-put
    alias rm 'trash-put'
end

if check_installed date
    alias now 'date "+%Y-%m-%d %H:%M:%S" | pbcopy'
end

if check_installed fzf
    alias f 'fzf'
    alias vif 'vim $(fzf)'
end


# Node.js
alias ni="npm install"
alias nrc="npm run local"
alias nrcl="npm run local:loose"
alias nrs="npm run start -s --"
alias nrb="npm run build -s --"
alias nrd="npm run dev"
alias nrt="npm run test -s --"
alias nrtw="npm run test:watch -s --"
alias nrv="npm run validate -s --"
alias rmn="rm -rf node_modules"
alias flush-npm="rm -rf node_modules && npm i && say NPM is done"
alias nicache="npm install --prefer-offline"
alias nioff="npm install --offline"


# Git
alias g='git'
alias gi='git init'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gdf='git diff'
alias gdfh='git diff HEAD'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gpl='git pull origin'
alias gpo='git push origin'
alias gst='git status'
alias gss='git status -s'
alias tasks='gh issue list --repo unvalley/projects'

