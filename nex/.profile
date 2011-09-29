#Bindings del nex
alias mate="/Users/nex/bin/mate"
alias m=mate
alias o=open

#txt
alias p="mate ~/Desktop/lepipeline.txt"
alias goals="mate ~/Desktop/goals.txt"
alias etc="mate ~/Desktop/etc.txt"

alias t10="cd /nex/todo;lein run;cd -"
alias bo=boom

#txts de lein y git
alias agit="cat ~/.git_aliases"
alias alein="cat ~/.lein_aliases"
#tendria que pasarlos a sus propios archivos y que sean los cats de dichos

#Archivos de Fractal (?)
alias fgit="/f/scripts/fgit"
alias f="cat ~/Dropbox/gral/txt/paginas-server"

#Navigation
alias ..="cd .."
alias ...="cd ../.."
alias drop="cd ~/Dropbox/"
alias desk="cd ~/Desktop/"

#Viewing
alias la="ls -lah"
alias laa="ls -lahF"
alias lsd='ls -l | grep "^d"'  #only directories


#Admin
alias chmodx="sudo chmod +x"
function mk(){
	mkdir $1
	cd $1
}


#IPs
alias ip="curl ifconfig.me"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

#ssh
alias fractal="ssh fractalmedia.mx"
alias fm="ssh 190.120.226.222"
alias s="ssh fm"
alias s0="ssh root@fm"
alias s1="ssh root@192.168.0.2"
alias s2="ssh root@192.168.0.3"

#bash & shit
alias mak="sudo make install"
alias port="sudo port install"
alias rip="sudo apt-get install"
alias encoding="file -I"
alias grep="grep --color=auto"


# config
alias dotshell="mate ~/.profile"
alias .bash="dotshell"
alias .git="mate ~/.git_aliases"
alias .lein="mate ~/lein_aliases"
alias .hosts="mate ~/.ssh/config"

# package management
alias prt="sudo port install"
alias app="sudo apt-get install"
alias sapti="sudo apt-get install"
alias saptr="sudo apt-get remove"
alias saptu="sudo apt-get upgrade"
alias saptd="sudo apt-get update"
alias saptc="apt-cache search"
alias sapts="apt-cache show"





#PATH=$PATH:~/.cljr/bin/
#export PATH
##
# Your previous /Users/nex/.profile file was backed up as /Users/nex/.profile.macports-saved_2011-04-18_at_13:30:38
##


#buenas utils OSX
alias eject='hdiutil eject' #drutil
alias emptytrash="rm -rfv ~/.Trash"
# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons (useful when presenting)
alias hided="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showd="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
#screensaver at desktop
alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background"
#Sound, notifications
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"


#Functions
# Create a new directory and enter it
md() {
  mkdir -p "$@" && cd "$@"
}


# All the dig info
digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}
 
google() {
      python -c "import sys, webbrowser, urllib;   webbrowser.open('http://www.google.com/search?' + urllib.urlencode({'q': ' '.join(sys.argv[1:]) }))" $@
  }

#serch 4 a file w/spotlight
spotlightfile() {
    mdfind "kMDItemDisplayName == '$@'wc";
}
#serch 4 contents w/spotlight
spotlightcontent() {
    mdfind -interpret "$@";
}
vman () {
     man -t $1 | open -a /Applications/Preview.app -f
  }
alias sf=spotlightfile
alias sc=spotlightcontent
alias ggl=google


#from http://bashscripts.org/forum/viewtopic.php?f=28&t=346
# Stock prices - can be called two ways. # stock novl  (this shows stock pricing)  #stock "novell"  (this way shows stock symbol for novell)
stock ()
{
stockname=`lynx -dump http://finance.yahoo.com/q?s=${1} | grep -i ":${1})" | sed -e 's/Delayed.*$//'`
stockadvise="${stockname} - delayed quote."
declare -a STOCKINFO
STOCKINFO=(` lynx -dump http://finance.yahoo.com/q?s=${1} | egrep -i "Last Trade:|Change:|52wk Range:"`)
stockdata=`echo ${STOCKINFO[@]}`
   if [[ ${#stockname} != 0 ]] ;then
      echo "${stockadvise}"
      echo "${stockdata}"
         else
         stockname2=${1}
         lookupsymbol=`lynx -dump -nolist http://finance.yahoo.com/lookup?s="${1}" | grep -A 1 -m 1 "Portfolio" | grep -v "Portfolio" | sed 's/\(.*\)Add/\1 /'`
            if [[ ${#lookupsymbol} != 0 ]] ;then
            echo "${lookupsymbol}"
               else
               echo "Sorry $USER, I can not find ${1}."
            fi
   fi
}

#Translate a Word  - USAGE: translate house spanish  # See dictionary.com for available languages (there are many).
translate ()
{
TRANSLATED=`lynx -dump "http://dictionary.reference.com/browse/${1}" | grep -i -m 1 -w "${2}:" | sed 's/^[ \t]*//;s/[ \t]*$//'`
if [[ ${#TRANSLATED} != 0 ]] ;then
   echo "\"${1}\" in ${TRANSLATED}"
   else
   echo "Sorry, I can not translate \"${1}\" to ${2}"
fi
}

# Define a word - USAGE: define dog
define ()
{
lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 3 -w "*"  | sed 's/;/ -/g' | cut -d- -f1 > /tmp/templookup.txt
         if [[ -s  /tmp/templookup.txt ]] ;then   
            until ! read response
               do
               echo "${response}"
               done < /tmp/templookup.txt
            else
               echo "Sorry $USER, I can't find the term \"${1} \""            
         fi   
rm -f /tmp/templookup.txt
}

#dirsize - finds directory sizes and lists them for the current directory
dirsize ()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm /tmp/list
}

#netinfo - shows network information for your system
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}

#bu - Back Up a file. Usage "bu filename.txt" 
bu () { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }


#OSX defaults
# Expand save panel by default
#defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Disable the “Are you sure you want to open this application?” dialog
#defaults write com.apple.LaunchServices LSQuarantine -bool false



#Emailin osx only?
function e {
echo "" | mail -s $1 $2
}
function ep {
e $1 jorge@fractalmedia.mx
}
function es {
e $1 daniel@fractalmedia.mx
}
function ej {
e $1 jam.fade@gmail.com
}
function ea {
e $1 andres@fractalmedia.mx
}
function eb {
echo $3 | mail -s $2 $1
}



#colores chiros
function prompt
{
local WHITE="\[\033[1;37m\]"
local GREEN="\[\033[0;32m\]"
local CYAN="\[\033[0;36m\]"
local GRAY="\[\033[0;37m\]"
local BLUE="\[\033[0;34m\]"
export PS1="
${GREEN}\u${CYAN}@${BLUE}\h ${CYAN}\w${GRAY}
$ "
}
prompt


#temp y unsorted
alias upfm="mvn install:install-file -DgroupId=fractal  \
-DartifactId=fm  \
-Dversion=1.0.0  \
-Dfile=fm-1.0.0-SNAPSHOT.jar  \
-Dpackaging=jar \
-DgeneratePom=true"

alias upgp="mvn install:install-file -DgroupId=fractal  \
-DartifactId=cljgp  \
-Dversion=1.0  \
-Dfile=cljgp-1.0.jar  \
-Dpackaging=jar \
-DgeneratePom=true"



# MacPorts Installer addition on 2011-04-18_at_13:30:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
#add ruby to path
export PATH=/Users/nex/.gem/ruby/1.8/bin:$PATH
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib
export PATH=$PATH:~/git/scripts/
export PATH=$PATH:~/bin/storm-0.5.0/bin
export PATH=$PATH:~/bin/
export JAVA_HOME=$(/usr/libexec/java_home)

source '/Users/nex/.lein_aliases'
source '/Users/nex/.git_aliases'


#cosas que no entiendo
# One of @janmoesen’s ProTip™s https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -m '$method'"; done