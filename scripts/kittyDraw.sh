#!/usr/bin/env zsh
# ktdraw , inpired in aladraw.
# Dependencies kitty slop wmctrl zsh
capture.geometry () { read -r X Y W H < <(slop -f "%x %y %w %h") }
kitty.open () { kitty --listen-on=unix:/tmp/"$sock" --title $sock &>/dev/null & }
move.window.to () { wmctrl -r "$sock" -e "0,$X,$Y,$W,$H" }
loop.window.to () { move.window.to || { sleep 0.1; loop.window.to } }
# Program
socks=($(print -l /tmp/kitty* 2> /dev/null))
if [[ $#socks -gt 0 ]];then
	typeset -F2 pcontrol=${${(s:_:)${socks[-1]}}[2]}
	typeset -F2 control=$((pcontrol + 0.01))
else
	typeset -F2 control=0.00
fi
sock="kitty_$control"
capture.geometry
kitty.open
loop.window.to
