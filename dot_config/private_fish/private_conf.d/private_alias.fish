alias vi='nvim'
alias vim='nvim'

alias cat='bat'
alias grep='rg'
alias zel='zellij'
alias c='code'

alias e='exa --icons --git'
alias l=e
alias ls=e
alias ea='exa -a --icons --git'
alias la=ea
alias ee='exa -aahl --icons --git'
alias ll=ee
alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
alias lt=et
alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
alias tree=eta
alias lta=eta
alias l='clear && ls'

alias rm=trash-put
alias now='date "+%Y-%m-%d %H:%M:%S" | pbcopy'

# fzf
alias vif='vim $(fzf)'

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
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gbd='git branch -d'

alias gc='git commit'
alias gcm='git commit -m'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gd='git diff'
alias gdh='git diff HEAD'
alias gi='git init'

alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'

alias gm='git merge --no-ff'
alias gpl='git pull origin'
alias gpo='git push origin'

alias gst='git status'
alias gss='git status -s'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gclean-local='git branch --merged | grep -v "*" | xargs -I % git branch -d %'

