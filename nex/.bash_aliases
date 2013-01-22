#Aliases del nex, ailgunos tomados de https://github.com/mathiasbynens/dotfiles/blob/master/.aliases

#navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ...="cd ../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias dirs='ls -l | grep "^d"'
alias f="cd $1; ls"
map() { if [ "$1" != "" ]; then alias $1="cd `pwd`"; fi } #create an alias to curren directory map [alias]
alias lh='ls -a | egrep "^\."'
alias cl='cd $1; ls'

#shortcuts
alias b=boom
alias c=cd
alias d=pwd
alias e=echo
alias g=git
alias l=lein
alias p=cat
alias s=sudo
alias v=vim

#CUTS
alias msf=msfconsole
alias buy="sudo apt-get install -y"
alias apt=apt-get

#git
alias board="php ~/github/Gitboard/gitboard.php"

#vim
alias ':q'='exit'

#networking
alias pi="ping -n"
alias hosts="nmap -sL 192.168.1.* | grep '('"
alias hosts0="nmap -sL 192.168.0.* | grep '('"
alias ports="nmap -sT -PN -vv"
alias hostsp="nmap -sP 192.168.1.* | grep '('"
alias ho=hosts
alias po=ports

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
alias who=whois

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#Web serving
alias webserv="python -m SimpleHTTPServer" #sirve el dir actual en local:8000

#filesystem
alias md5=md5sum
alias fs="stat -f \"%z bytes\""
alias path="/usr/bin/perl -e 'use Cwd; foreach my \$file (@ARGV) {print Cwd::abs_path(\$file) .\"\n\" if(-e \$file);}'"

#system
alias 'ps?'='ps ax | grep '

#meta
alias z=zsh
alias va='vim ~/.bash_aliases; source ~/.bash_aliases && echo "aliases sourced"'
alias reload='. ~/.bashrc'
alias aliases='vim ~/.bash_aliases'

#longer stuff and fns
mk () { mkdir -p "$@" && cd "$@"; }
#quick calculator
#? () { echo "$*" | bc -l; }
#creates date-based tgz of current dir, runs in the background
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); S=$SECONDS; tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" && logger -s "Tarred $D to $F in $(($SECONDS-$S)) seconds" ) & )'
