# Executes commands at the start of an interactive session.
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# zgen
export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
        echo "Creating a zgen save"

        zgen prezto gnu-utility prefix 'g'
        zgen prezto editor key-bindings 'vi'
        zgen prezto prompt theme 'agnoster'
        #zgen prezto tmux:auto-start local 'yes'
        zgen prezto '*:*' case-sensitive 'yes'
        zgen prezto '*:*' color 'yes'

        zgen prezto
        zgen prezto environment
        zgen prezto terminal
        zgen prezto editor
        zgen prezto directory
        zgen prezto spectrum
        zgen prezto homebrew
        zgen prezto completion
        zgen prezto git
        zgen prezto archive
        zgen prezto osx
        zgen prezto command-not-found
        zgen prezto fasd
        zgen prezto history-substring-search
        zgen prezto syntax-highlighting
        zgen prezto prompt

        zgen load djui/alias-tips
        #zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
        zgen load caarlos0/zsh-git-sync
        zgen load TBSliver/zsh-plugin-colored-man
        zgen load mafredri/zsh-async
        zgen load junegunn/fzf shell
        
        zgen load zsh-users/zsh-syntax-highlighting
        zgen load tarruda/zsh-autosuggestions

        zgen save
fi

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# Customize to your needs...
# Agnoster User configuration
export DEFAULT_USER="drecking"
[[ $TMUX = "" ]] && export TERM="xterm-256color"
export KEYTIMEOUT=1

export MANPAGER='col -bx | vim -c ":set ft=man nonu nolist" -R -'
export EDITOR='subl -w'
export GIT_EDITOR=vim
export apiurl='https://api-z27.compute.us6.oraclecloud.com'
export username="/Compute-usoracle17704/girish.ahuja@oracle.com"
export tenant="/Compute-usoracle17704"

#Proxy
export HTTP_PROXY=http://www-proxy.us.oracle.com:80
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTP_PROXY
export HTTPS_PROXY=$HTTP_PROXY
export ftp_proxy=$HTTP_PROXY
export rsync_proxy=$HTTP_PROXY
export RSYNC_PROXY=$HTTP_PROXY
export no_proxy="localhost,127.0.0.1,us.oracle.com,oracleoutsourcing.com,192.168.99.100"
alias proxyoff='unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY ftp_proxy rsync_proxy'
eval $(thefuck --alias fuck)

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# SAVE HISTORY AND SHRE BETWEEN SESSIONS
## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=100000
SAVEHIST=100000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Aliases
alias epoch="date -j -f '%a %b %d %T %Z %Y' '`date`' '+%s'"
alias idle="python -m idlelib.idle"
alias c='clear'
alias ls='ls --color=always'
alias grep='grep --color=auto'
alias ccat='pygmentize-3.4 -g'
alias s='ssh -l drecking'
alias sr='ssh -l root'
alias extract='grep -F -x -v -f  $1 $2' #$1 equals keyfile $2 equals master
alias pscan='sudo nmap -v -sn $2 -oG -' # ping scan a host
alias pscanf='sudo nmap -sn -sL -PE -n -v --system-dns --disable-arp-ping -iL $1 -oG - > output >/dev/null 2>&1'
alias mco_shell_me='gzip -c $1 | base64 -w0' #$1 is filename to compress
alias mco_shell_deploy="mco shell 'echo "{$1}" |base64 -di|gzip -d|bash'"
alias shareme='sudo python -m SimpleHTTPServer 80'
alias mcop='mco -c ~/.mcollective/prod-client.cfg $*'
alias mcou='mco -c ~/.mcollective/uat-client.cfg $*'
alias oc='oracle-compute -a $apiurl -u $username -p /Users/drecking/pass $*'
alias na='nimbula-api -a $apiurl -u $username -p /Users/drecking/pass $*'
alias naa='nimbula-admin -a $apiurl -u $username -p /Users/drecking/pass $*'
alias pjson='python -mjson.tool $*'
alias uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]'  | pbcopy && pbpaste && echo"
alias todo="~/.todo/todo.sh $*"
alias weather="~/bin/weather.15m.py"

# Mac Helpers
function hideallfiles(){
     defaults write com.apple.finder AppleShowAllFiles -bool NO
     killall Finder
}
function showallfiles(){
     defaults write com.apple.finder AppleShowAllFiles -bool YES
     killall Finder
}
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# Various exports
source ~/.xsh
eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
