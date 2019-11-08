#!/usr/bin/sh

[ "$CURRENT_GPU" != "nvidia" ] && exit

nvidia-smi -q --display=TEMPERATURE | sed '/GPU Current/!d' | cut -d: -f2 | tr -d " "  | sed 's/C//'

