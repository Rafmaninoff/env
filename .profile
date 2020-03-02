#!/bin/sh

export PATH="/usr/lib/ccache/bin/:$PATH:/home/$USER/bin:$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')/home/$USER/.local/bin:/home/$USER/.cargo/bin/"
#Ensure the qt5 theming can be controlled by qt5ct.
export QT_QPA_PLATFORMTHEME="qt5ct"

#default applications.
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
	export RANGER_LOAD_DEFAULT_RC="FALSE"
export FILE="ranger"


