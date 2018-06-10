# Source Defaults
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Activate .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Usb automount
udiskie --no-notify &

# set dpi for thinkpad X230
xrandr --dpi 125.37

# Start i3wm
exec i3
