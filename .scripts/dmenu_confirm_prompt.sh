#!/bin/bash

#prompts a binary question with $1 as the question, if yes, perform the $2 command

[ $(echo -e "No\nYes" | dmenu -i -p "$1") == "Yes" ] && $2
