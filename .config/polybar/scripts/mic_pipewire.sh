#!/usr/bin/env zsh

polymic () 
{
	<<- example
	[module/mic]
	type = ipc
	type = custom/ipc
	hook-0 = echo "Mic Aberto"
	hook-1 = echo "Mic Fechado"
	click-left = mic.sh
	example

}

# Verifique se a entrada de som está muda
if [[ $(pactl list sources | grep -A 10 RUNNING | grep Mute | awk '{print $2}') == "yes" ]]; then
	pactl set-source-mute @DEFAULT_SOURCE@ toggle
	polybar-msg hook mic 2
else
	pactl set-source-mute @DEFAULT_SOURCE@ toggle
	polybar-msg hook mic 1
fi
