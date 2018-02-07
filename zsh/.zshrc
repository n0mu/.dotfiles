
# Load zsh quickstart quit
if [ -f ~/.config/zsh/zshrc_quickstart_kit ]; then
  source ~/.config/zsh/zshrc_quickstart_kit
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
