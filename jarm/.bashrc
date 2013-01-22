# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# --------------------------------------------------------------------------------
# SET
# --------------------------------------------------------------------------------
# readline vi bindings
set -o emacs

# SHOPTS
# --------------------------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct minor spelling errors in cd commands
shopt -s cdspell

# Allow files beginning with a dot ('.') to be returned in the results of 
# path-name expansion
#shopt -s dotglob

# ksh-88 egrep-style extended pattern matching
# ?(pattern-list)
#   Matches zero or one occurrence of the given patterns 
# *(pattern-list)
#   Matches zero or more occurrences of the given patterns 
# +(pattern-list)
#   Matches one or more occurrences of the given patterns 
# @(pattern-list)
#   Matches exactly one of the given patterns 
# !(pattern-list)
#   Matches anything except one of the given patterns 
shopt -s extglob



# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# --------------------------------------------------------------------------------
# PROMPT
# --------------------------------------------------------------------------------

# Return Code 
function returncode
{
    returncode=$?
    if [ $returncode != 0 ]; then
        echo "[$returncode]:"
    else
        echo ""
    fi
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt
if [ $UID -eq 0 ] ; then
PS1="${debian_chroot:+($debian_chroot)}\[\033[31m\]\u@\h\[\033[00m\]:\[\033[33m\]\w\[\033[00m\]\n# "
else
PS1="${debian_chroot:+($debian_chroot)}\[\033[32m\]\u@\h\[\033[00m\]:\[\033[33m\]\w\[\033[00m\]\n% "
fi
# --------------------------------------------------------------------------------
# COMPLETION
# --------------------------------------------------------------------------------
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# bash-builtins
if [ -f /etc/bash_completion.d/bash-builtins ]; then
    . /etc/bash_completion.d/bash-builtins
fi

# apt - produces errors - possible bug
#if [ -f /etc/bash_completion.d/apt ]; then
#    . /etc/bash_completion.d/apt
#fi

# git
if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi

# --------------------------------------------------------------------------------
# ALIASES
# --------------------------------------------------------------------------------
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -L -F --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Safer (just in case), also consider using .bash_aliases
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

# hugs with vi 
alias hugs='hugs +t +I +w +. +k +s -E"vim +%d %s"'

# less is most (lol)
#alias less='most'

# Debian aliases
alias pinstall='sudo apt-get install -y'
alias psearch='apt-cache search'
alias premove='sudo apt-get remove -y'
alias pupdate='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias pclean='sudo apt-get autoremove -y; sudo apt-get autoclean; sudo apt-get clean'
alias pshow='apt-cache show'

# Netbeans alias
alias netbeans='/opt/netbeans-6.9.1/bin/netbeans &'

# Squeeze/Sid Maven workaround
alias mvn='mvn -Djava.net.preferIPv4Stack=true'

# ICC2 Subversion repo
alias svn-co='svn co http://132.248.181.98/svn/Equipo5/trunk/'

# Local Aliases
# Remote Desktop for local Magicinfo server
alias rbk1='rdesktop 192.168.1.3 -u Administrator -a 16 -k es -g 1500x1000 &'
alias rf1='rdesktop 192.168.1.4 -u Administrator -a 16 -k es -g 1500x1000 &'
alias rf2='rdesktop 192.168.1.5 -u administrator -a 16 -k es -g 1500x1000 &'
alias rf3='rdesktop 192.168.1.7 -u Administrator -a 16 -k es -g 1500x1000 &'
alias rbk2='rdesktop 192.168.1.6 -u Administrator -a 16 -k es -g 1500x1000 &'
alias rsandbox='rdesktop 192.168.1.10 -u Administrator -a 16 -k es -g 1500x1000 &'
alias rcont='rdesktop 192.168.1.21 -u audio3 -a 16 -k es -g 1910x1120 &'
alias rscala='rdesktop 192.168.1.50 -u zotac -a 16 -k es -g 1910x1120 &'

# Rdesktop funcion
rd(){
  case "$2" in
    small)
      size=1024x768
      ;;
    big)
      size=1910x1120
      ;;
    *)
      size=1500x1000
      ;;
  esac
  rdesktop 192.168.1.$1 -u administrator -a 16 -k es -g $size &
}

# vboxcontrol aliases
alias vboxcontrol='sudo service vboxcontrol'
alias start-vm='sudo service vboxcontrol start-vm'
alias stop-vm='sudo service vboxcontrol stop-vm'
alias status='sudo service vboxcontrol status'

# Hamachi
alias start-hamachi='sudo /etc/init.d/logmein-hamachi start'
alias stop-hamachi='sudo /etc/init.d/logmein-hamachi stop'

# Getting Shit Fucking Done
alias gsfd='cd ~/git/gsfd;lein run;cd -'
alias egsfd='vim ~/gsfd'

# Rhino rlwrapped
alias rhino='rlwrap -armpc rhino'

# Paola's reverse ssh
alias limoncito='ssh -p 22221 paola@localhost'

# grep ford.csv
gford(){
  grep -i $1 /home/jarm/Dropbox/tecnomania/ford.csv
}

grepp(){ 
  [ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if/$1/i" < "$2";
}

