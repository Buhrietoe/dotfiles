#!/bin/sh

ARG=$1

case $ARG in
"g" )
`cp -f ~/xguis/.xinitrc_gnome ~/.xinitrc`
;;
"k" )
`cp -f ~/xguis/.xinitrc_kde ~/.xinitrc`
;;
"s" )
`cp -f ~/xguis/.xinitrc_scrotwm ~/.xinitrc`
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
