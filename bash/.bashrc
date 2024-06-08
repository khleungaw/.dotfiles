# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000

## Environment Variables 

# Default apps
export PAGER=less
export VISUAL=nano
export EDITOR=nano

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Java
export JAVA_HOME=/usr/lib/jvm/java-22-openjdk

## Customization

# Login Banner
clear
echo -e "\e[38;5;214m$(( ( $(date -d '2025-04-25' +%s) - $(date +%s) ) / 86400 )) days till 2025-04-25\e[0m"

# Prompt
parse_git_branch() {
		git branch 1> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[01;32m\][\u@\h]\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] $ '

## Alias
alias ls='ls --color=auto -l'
alias grep='grep --color=auto'
alias tree='tree -C --filelimit 10'
