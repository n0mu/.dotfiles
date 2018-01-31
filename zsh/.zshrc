# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/Users/jorgea/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall

# Autojump
#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# Custom window title zsh function only command
# https://bbs.archlinux.org/viewtopic.php?id=181149
case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
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
