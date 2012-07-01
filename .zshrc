bindkey -e 

export LANG=ja_JP.UTF-8

export PATH=/usr/local/bin:$HOME/local/bin:$PATH:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin
export PATH=$PATH:/Applications/android-sdk-mac_86/tools
export PATH=$PATH:$HOME/Documents/work/play
export MANPATH=/usr/local/man:/usr/share/man:/opt/local/man
export GAE_PATH=$HOME/Documents/work/appengine-java-sdk

PROMPT="%{[36m%}[%n@%m %.]%(!.#.$) %{[m%}"

#alias ls='/bin/ls --color=auto'
alias ll='/bin/ls -laGF'
alias vi='vim'
alias rm='rm -i'
alias ..='cd ..'

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history

autoload -Uz compinit; compinit

setopt auto_cd
setopt auto_pushd 
setopt append_history
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt NO_beep
setopt hist_ignore_all_dups
setopt mark_dirs
setopt print_eight_bit
setopt share_history
export MAILCHECK=0
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
