#!/usr/bin/env bash
if pgrep yad > /dev/null 2>&1; then
  pkill yad
else
  yad --title='Calendar' --calendar --no-buttons --undecorated --posx=1070 --posy=43 &
fi
