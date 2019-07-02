#!/bin/bash

case $BLOCK_BUTTON in
	1) notify-send "Usage of paritions:
	$(df -h | grep -Ev 'snap|tmpfs|udev|boot|^Filesystem' | awk '{ print $6 ": " $3 " / " $2 }') " ;;

esac

df -h ~ | awk '/\/$/ { print $3 " / " $2 }'

