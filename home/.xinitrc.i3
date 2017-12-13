has_keyboard() {
    lsusb | egrep -q 'Classic Keyboard 200|Creative Labs Wireless Keyboard/Mouse|EIZO Corp.'
}

# X11 setting
xrdb -merge ~/.Xdefaults
xrandr --dpi 120
if has_keyboard ; then
    # big display only
    xrandr --output eDP-1 --off
fi

# Keyboard and Mouse wheel
[ -h ~/.Xmodmap ] && unlink ~/.Xmodmap
if has_keyboard ; then
    ln -s ~/.Xmodmap.us ~/.Xmodmap
else
    ln -s ~/.Xmodmap.jis ~/.Xmodmap
fi

exec i3
