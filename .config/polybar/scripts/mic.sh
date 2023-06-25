#!/usr/bin/env zsh

# Depe:
# pulseaudio-ctl

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

if [[ ${${(s: :)"$(pulseaudio-ctl full-status)"}[3]} == "yes" ]]; then
	pulseaudio-ctl mute-input
	polybar-msg hook mic 2
	notify-send "MICROPHONE" "ON"
	#mpv $HOME/.songs/bubble_pop.mp3
else
	pulseaudio-ctl mute-input
	polybar-msg hook mic 1
	notify-send "MICROPHONE" "OFF"
	#mpv $HOME/.songs/bubble_pop.mp3
fi
