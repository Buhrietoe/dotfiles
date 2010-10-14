#!/bin/sh

ARG=$1

case $ARG in
"gnome" )
`cp -f ~/xguis/.xinitrc_gnome ~/.xinitrc`
;;
"dwm" )
`cp -f ~/xguis/.xinitrc_dwm ~/.xinitrc`
;;
** )
echo
echo "Not a valid option."
echo
exit 1
;;
esac

startx

exit 0
