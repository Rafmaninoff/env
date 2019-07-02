#!/bin/bash

#approx timeout rate in miliseconds (checked every 5 seconds)
timeout="20000"

#take a screenshot
scrot /tmp/screen.png

#make it blurry
convert /tmp/screen.png -paint 3 /tmp/screen.png

#add the lock to the image
[[ -f ~/dotfiles/i3/lock.png ]] && convert /tmp/screen.png ~/dotfiles/i3/lock.png -gravity center -composite -matte /tmp/screen.png

#lock it!
i3lock -e -f -c 000000 -i /tmp/screen.png

#if still locked after $timeout miliseconds, turn off screen
while  [[ $(pgrep -x i3lock) ]]; do
	[[ $timeout -lt $(xssstate -i) ]] && xset dpms force off
	sleep 5
done
