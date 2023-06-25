#!/usr/bin/env sh

shuffle_cmus() {
SHUFFLE=$(cmus-remote -S | grep 'shuffle' | awk '{print $3}')
STATUS=" "
if [ "$SHUFFLE" = "off" ]; then
  cmus-remote -C set\ shuffle=off
	STATUS=" Off"

	elif [ "$SHUFFLE" = "tracks" ]; then
    cmus-remote -C set\ shuffle=tracks
		STATUS=" Tracks"

	elif [ "$SHUFFLE" = "albums" ]; then
		cmus-remote -C set\ shuffle=albums
		STATUS=" Albums"
fi
}
shuffle_cmus
