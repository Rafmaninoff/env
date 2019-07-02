#!/bin/bash

while [ TRUE ]; do
	clear
	curl -s wttr.in | head -n37
	sleep 5m
done
