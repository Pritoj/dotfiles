# GIT ALIASES TO SAVE MY LIFE
alias gpush='echo "Pushing $(git rev-parse --abbrev-ref HEAD) 🔥"; git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpushf='echo "Forcibly pushing $(git rev-parse --abbrev-ref HEAD) 😈"; git push origin $(git rev-parse --abbrev-ref HEAD) -f'
alias go='echo "Checkout 👽"; git checkout'

# Commiting
alias gmend='echo "Amending yo shiz 🤷";git commit --amend'
alias gomit='echo "Lets commit this shiz 🚀";git commit'

# Stashing
alias rebtash='echo "🤖Rebasing on the provided branch and autostashing";git rebase --autostash'
alias gtashall='echo "🌪 Stash it"; git add .; git stash'
alias gtashpop='echo "☄️ Poppin that stash"; git stash pop'

# Status
alias gstatus='echo "👀Here is a status of this repo";git status'
# No emoji or echo here since they open a new prompt
alias glog='git log'
alias glogol='glog --oneline'
