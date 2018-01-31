# Lines configured by zsh-newuser-install
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"


# Long running processes should return time after they complete. Specified
# in seconds.
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# Expand aliases inline - see http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# Customize to your needs...
# Stuff that works on bash or zsh
if [ -r ~/.sh_aliases ]; then
  source ~/.sh_aliases
fi

# Stuff only tested on zsh, or explicitly zsh-specific
if [ -r ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -r ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi


# JAVA setup 
if [ -d /Library/Java/Home ];then
  export JAVA_HOME=/Library/Java/Home
fi

#####################################################
# Custom window title zsh function                  #
# https://bbs.archlinux.org/viewtopic.php?id=181149 #
#####################################################
case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
		precmd () { print -Pn "\e]0;$USERNAME@$HOSTNAME - Terminal\a" }
		preexec () { print -Pn "\e]0;$1\a" }
	;;
    screen|screen-256color)
    	precmd () {
			print -Pn "\e]83;title \"$1\"\a"
			print -Pn "\e]0;$TERM\a"
		}
		preexec () {
			print -Pn "\e]83;title \"$1\"\a"
			print -Pn "\e]0;$TERM - $1\a"
		}
	;;
esac
