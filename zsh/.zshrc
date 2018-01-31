# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

#####################################################
# Custom window title zsh function                  #
# https://bbs.archlinux.org/viewtopic.php?id=181149 #
#####################################################
if [ "$TERM" = 'rxvt*' ] || [ "$TERM" = 'develop' ] ; then
  precmd () { print -Pn "\e]0;$USERNAME@$HOSTNAME - Terminal\a" }
  preexec () { print -Pn "\e]0;$1\a" }
fi
# case $TERM in
#     *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
# 		precmd () { print -Pn "\e]0;$USERNAME@$HOSTNAME - Terminal\a" }
# 		preexec () { print -Pn "\e]0;$1\a" }
# 	;;
#     screen|screen-256color)
#     	precmd () {
# 			print -Pn "\e]83;title \"$1\"\a"
# 			print -Pn "\e]0;$TERM\a"
# 		}
# 		preexec () {
# 			print -Pn "\e]83;title \"$1\"\a"
# 			print -Pn "\e]0;$TERM - $1\a"
# 		}
# 	;;
# esac
