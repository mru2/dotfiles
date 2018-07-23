#! /bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Background color
xsetroot -solid "#4C5669"

# Start WM
exec i3
