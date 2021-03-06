
# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

if $(colorize /etc/hosts &>/dev/null)
then
    alias cat="colorize"
fi

# GRC colorizes nifty unix tools all over the place
if $(grc &>/dev/null) && ! $(brew &>/dev/null)
then
  source `brew --prefix`/etc/grc.bashrc
fi

alias clean_="find . -name '._*' -type f -delete"

# Sets permissions recursively from current directory for directories
rperm_dir() {
  find $2 -type d -exec chmod $1 {} \;
}

# Sets permissions recursively from current directory for files
rperm_file() {
  find $2 -type f -exec chmod $1 {} \;
}

# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source `brew --prefix`/etc/grc.bashrc
fi

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Convert flac to mp3
alias flac2mp3='for f in *.flac; do flac -cd "$f" | lame -h -b 320 - "${f%.*}".mp3; done'
