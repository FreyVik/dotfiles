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

# Load alias
[ -f ~/.aliases ] && source ~/.aliases

compdef _ls eza

# Functions
function docker_list {
  containers=$(docker ps | awk '{if (NR!=1) print $1 ": " $(NF)}')

  echo "👇 Containers 👇"
  echo $containers
}

# Keybinding
_display_test_message() {
    echo -n "This is a test message"
}

#Need to register the funtion
zle	-N	_display_test_message	

# Create the binding
bindkey	'^h'	_display_test_message	
