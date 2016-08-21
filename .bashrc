################################################################################
#                                                                              #
#                                  ____   ____ ____          _                 #
#    DGBash: a .bashrc            |  _ \ / ___| __ \____ ___| |__              #
#                                 | | | | |  _||__)/ _  / __| |_ \             #
#    © 2016 Devin Gund            | |_| | |_| ||__)|(_| \__ \ | | |            #
#    dgund.com                    |____/ \____|____/__'_|___/_| |_|            #
#                                                                              #
#                                                                              #
################################################################################


################################################################################
# (0) Contents
################################################################################
# (1) General
# (2) Colors
# (3) Start Message
# (4) Shell Prompt
# (5) Aliases
# (6) Functions


################################################################################
# (1) General
################################################################################
# If not running interactively, no need for setup
[[ $- != *i* ]] && return

# Source global definitions from /etc/bashrc if present
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source completions from /etc/bash_completion if present
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Correct directory spelling
shopt -q -s cdspell

# Update display on terminal window resize
shopt -q -s checkwinsize

# Enable extended pattern matching
shopt -q -s extglob

# Append history on exit
shopt -s histappend

# Enable multi-line command in history
shopt -q -s cmdhist

# Enable immediate notification of background job termination
set -o notify

# Disable incoming mail notifications
shopt -u mailwarn
unset MAILCHECK

# Disable core files
ulimit -S -c 0 > /dev/null 2>&1

# Store 1000 commands in history buffer
export HISTSIZE=1000

# Store 2000 commands in history file
export HISTFILESIZE=2000

# Ignore duplicates in history
export HISTIGNORE='&:[ ]*'

# Set vim as default text editor
export EDITOR=vim
export VISUAL=vim

# Use less command as a pager
export PAGER=less

# Set GCC colors (error: red, warning: yellow)
export GCC_COLORS='error=01;31:warning=01;33'


################################################################################
# (2) Colors
################################################################################
# No color
NC='\033[m'

# Standard colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold colors
BLACK_BOLD='\033[1;30m'
RED_BOLD='\033[1;31m'
GREEN_BOLD='\033[1;32m'
YELLOW_BOLD='\033[1;33m'
BLUE_BOLD='\033[1;34m'
PURPLE_BOLD='\033[1;35m'
CYAN_BOLD='\033[1;36m'
WHITE_BOLD='\033[1;37m'

# Background colors
BLACK_BACKGROUND='\033[40m'
RED_BACKGROUND='\033[41m'
GREEN_BACKGROUND='\033[42m'
YELLOW_BACKGROUND='\033[43m'
BLUE_BACKGROUND='\033[44m'
PURPLE_BACKGROUND='\033[45m'
CYAN_BACKGROUND='\033[46m'
WHITE_BACKGROUND='\033[47m'


################################################################################
# (3) Start Message
################################################################################
echo -e ""
echo -e "Welcome to ${RED_BOLD}$HOSTNAME${NC}, ${RED_BOLD}$USER${NC}."
date +'%A, %B %-d, %Y %T %Z'
echo -e ""


################################################################################
# (4) Shell Prompt
################################################################################
PS1="[\u@\h:\w]> "


################################################################################
# (5) Aliases
################################################################################
# List hidden files
alias la='ls -A'

# List contributors to a git branch, ordered by number of commits
alias gitContributors ='git shortlog -n -s -e'


################################################################################
# (6) Functions
################################################################################
# Extract generic files (https://github.com/xvoland/Extract/blob/master/extract.sh)
function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "usage: extract [file]."
    else
        if [ -f $1 ] ; then
            # NAME=${1%.*}
            # mkdir $NAME && cd $NAME
            case $1 in
            *.tar.bz2)   tar xvjf ../$1    ;;
            *.tar.gz)    tar xvzf ../$1    ;;
            *.tar.xz)    tar xvJf ../$1    ;;
            *.lzma)      unlzma ../$1      ;;
            *.bz2)       bunzip2 ../$1     ;;
            *.rar)       unrar x -ad ../$1 ;;
            *.gz)        gunzip ../$1      ;;
            *.tar)       tar xvf ../$1     ;;
            *.tbz2)      tar xvjf ../$1    ;;
            *.tgz)       tar xvzf ../$1    ;;
            *.zip)       unzip ../$1       ;;
            *.Z)         uncompress ../$1  ;;
            *.7z)        7z x ../$1        ;;
            *.xz)        unxz ../$1        ;;
            *.exe)       cabextract ../$1  ;;
            *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}


################################################################################
################################################################################

