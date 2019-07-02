#!/bin/bash

xinput > /tmp/xinput
dev_id=`cat /tmp/xinput | grep -i 'synps/2 synaptics touchpad' | cut -d= -f2 | cut -f1`

xinput list-props $dev_id > /tmp/xinput_props

prop_id=`cat /tmp/xinput_props | grep -i 'libinput tapping enabled ([0-9][0-9][0-9])' | cut -d\( -f2 | cut -d\) -f1`

xinput set-prop $dev_id $prop_id 1

rm /tmp/xinput*
