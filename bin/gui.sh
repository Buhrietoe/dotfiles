#!/bin/sh

ARG=$1

case $ARG in
"c" )
`cp -f ~/bin/xguis/.xinitrc_cinnamon ~/.xinitrc`
;;
"g" )
`cp -f ~/bin/xguis/.xinitrc_gnome ~/.xinitrc`
;;
"k" )
`cp -f ~/bin/xguis/.xinitrc_kde ~/.xinitrc`
;;
"s" )
`cp -f ~/bin/xguis/.xinitrc_spectrwm ~/.xinitrc`
;;
"l" )
`cp -f ~/bin/xguis/.xinitrc_lxde ~/.xinitrc`
;;
"o" )
`cp -f ~/bin/xguis/.xinitrc_openbox ~/.xinitrc`
;;
"i" )
`cp -f ~/bin/xguis/.xinitrc_i3 ~/.xinitrc`
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
