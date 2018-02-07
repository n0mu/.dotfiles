#!/bin/zsh
# Stuff that works on bash or zsh

ZSH_THEME="absolute"

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

# Load zsh quickstart quit
if [ -f ~/.config/zsh/zsh_quickstart_kit ]; then
  source ~/.config/zsh/zsh_quickstart_kit
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
