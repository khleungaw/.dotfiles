# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000

# Color support for commands
alias ls='ls --color=auto -l'
alias grep='grep --color=auto'
alias tree='tree -C --filelimit 10'

# Default apps
export PAGER=less
export VISUAL=nano
export EDITOR=nano

# Prompt
parse_git_branch() {
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[01;32m\][\u@\h]\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] $ '

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
