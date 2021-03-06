### Set up the prompt

setopt histignorealldups sharehistory

### Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

### Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

### Use modern completion system
autoload -Uz compinit
compinit

# setopt autocd
setopt autopushd pushdignoredups
### better tab completion
# source ~/.local/share/fzf-tab/fzf-tab.plugin.zsh

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

################################################################
#               Custom configuration                           #
################################################################

### Save and retrieve directory history.
# while read -r line; do
#   pushd -q "$line" 2> /dev/null > /dev/null
# done < ~/.local/share/zsh/cd_history
zshexit() {
  dirs -lv | awk -F '\t' '{print $2}' | tac > ~/.local/share/zsh/cd_history
}

### Display Tab Name
function set_tab_name() {
  name=$(pwd | sed "s#$HOME#~#g")
  echo -ne "\033];Terminal - $name\007"
}
set_tab_name

### Prompt Configuration
### show branch in prompt
function get_git_branch_name() {
  local brname=$(git branch 2>/dev/null | grep '*' | cut -d' ' -f2 || echo "")
  if [ ! -z "$brname" ]; then
    echo " ($brname)"
  fi
}
function get_py_venv_name() {
  local venv_name=$(basename $VIRTUAL_ENV 2>/dev/null)
  if [ ! -z "$venv_name" ]; then
    echo " {{$venv_name}}"
  fi
}

function mkPrompt() {
  PROMPT="%B(%n@%m)%b %F{green}[%126<...<%~]%F{blue}"$(get_git_branch_name)"%F{red}"$(get_py_venv_name)$'\n'"%}%F{white} %# %b%f%k"
}
mkPrompt

### Register hooks
chpwd() {
  set_tab_name
}

precmd() {
  mkPrompt
}


### Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
### Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
export EDITOR=nvim

### teleport between recent folders
function tp() {
  \cd $(dirs -v | fzf --reverse --filepath-word --cycle --tiebreak index | cut -d$'\t' -f 2 | sed "s#~#$HOME#")
}

export FZF_DEFAULT_OPTS="--cycle --ansi --reverse"

### FZF for ctrl-R
uniq_history() {
  history 0 | sort -b -k 2 | tac | uniq -f 1 | sort -nk 1 | sed 's/\\\\n/\\\\\\n/g'
}
fzf_history_search() {
  local IFS=' '
  result=$(uniq_history | sed 's/^ *[0-9]* *//' | fzf -i --ansi --height 40% --reverse --inline-info +s +m -x --tac -e -q "$BUFFER")
  #  --prompt "$(print -nP $PROMPT)"
  if [[ -n $result ]]; then
    BUFFER=$(print -P $result)
  fi
  zle reset-prompt
  zle end-of-line
}
zle -N fzf_history_search
bindkey '^r' fzf_history_search

export CC=clang
export CXX=clang++

alias ls='ls --color=auto'
alias rm='rm -i'
alias touchscreen-enable="xinput enable 'ELAN Touchscreen'"
alias touchscreen-disable="xinput disable 'ELAN Touchscreen'"
alias mypy3="source $HOME/Documents/coding/python3env/bin/activate"
alias gpp='g++-8 -std=c++17 -O2 -DLOCAL_EXEC -Wall -g -fsanitize=address,undefined'
alias fd=fdfind
alias dotfiles="git --git-dir=$HOME/Documents/misc/dotfiles --work-tree=$HOME"
alias vi=nvim
alias vim=nvim

PATH=$PATH:/usr/local/go/bin
PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
PATH=$PATH:$HOME/.cabal/bin
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
PATH="$HOME/.elan/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH=$PATH:$HOME/.emacs.d/bin

### Starship prompt
#eval "$(starship init zsh)"
