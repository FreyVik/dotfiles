# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/frey/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Functions on prompt
# setopt PROMPT_SUBST

# Load alias
[ -f ~/.aliases ] && source ~/.aliases

compdef _ls eza

# Functions
function docker_list {
  containers=$(docker ps | awk '{if (NR!=1) print $1 ": " $(NF)}')

  echo "👇 Containers 👇"
  echo $containers
}

function mkcd {
    mkdir -p "$1" && cd "$1"
}

# Keybinding
## Define function
_ls_move() {
    move_dir=$(ls | fzf)
    cd "$move_dir"
}

_fzf_history() {
    command=$(fc -rl 1 | awk '{$1="";print substr($0,2)}' | fzf)
    echo -n $command
}


## Need to register the funtion
zle	-N	_ls_move
zle	-N	_fzf_history

## Create the binding
bindkey	'^h'	_ls_move
bindkey	'^r'	_fzf_history

# PROMPT
PROMPT="%{%F{39}%}%{%f%} %{%F{%(?.green.red)}%}%n%{%f%}@%M %2~ %# "

# RPROMPT
RPROMPT="%{%F{241}%}%T%{%f%}"