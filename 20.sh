#!/bin/bash
tomato_path="~/tools/tomato"

at now + 24 minutes -q r 2>/dev/null <<EOF
timidity -A 800 $tomato_path/prebreak2.mid &
EOF

at now + 25 minutes -q r 2>/dev/null <<EOF
timidity -A 800 $tomato_path/break2.mid &
gnome-screensaver-command -l
sleep 300
timidity $tomato_path/unlock.mid &
gnome-screensaver-command -d 
20.sh
EOF

