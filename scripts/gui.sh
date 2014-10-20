#!/bin/sh

ARG=$1

case $ARG in
"c" )
`cp -f ~/scripts/xguis/.xinitrc_cinnamon ~/.xinitrc`
;;
"g" )
`cp -f ~/scripts/xguis/.xinitrc_gnome ~/.xinitrc`
;;
"k" )
`cp -f ~/scripts/xguis/.xinitrc_kde ~/.xinitrc`
;;
"s" )
`cp -f ~/scripts/xguis/.xinitrc_spectrwm ~/.xinitrc`
;;
"l" )
`cp -f ~/scripts/xguis/.xinitrc_lxde ~/.xinitrc`
;;
"o" )
`cp -f ~/scripts/xguis/.xinitrc_openbox ~/.xinitrc`
;;
"i" )
`cp -f ~/scripts/xguis/.xinitrc_i3 ~/.xinitrc`
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
