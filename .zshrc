source /opt/antigen/antigen.zsh


## Antigen config ##

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# Common
antigen bundle common-aliases
antigen bundle sudo
antigen bundle docker
#antigen bundle ssh-agent
#antigen bundle knife
#antigen bundle jsontools
#antigen bundle svn
#antigen bundle git

# Bundles from other repos
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# OS dependant
case "$OSTYPE" in
  darwin*) 
    antigen bundle macports
    antigen bundle osx
    ;;
  linux*)
    #antigen bundle systemd
    antigen bundle tmux
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOSTART_ONCE=true
    ZSH_TMUX_AUTOCONNECT=true
    ;;
esac

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply


## User config ##

stty -ixon
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export EDITOR=vim
