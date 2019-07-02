export PATH=/usr/lib/ccache/bin/:$PATH:~/bin:~/dotfiles/scripts:~/.local/bin/:~/nativefied/launchers/

#---# Nested directory helpers #---#
abbrev-alias -g "..."="../.."
abbrev-alias -g "...."="../../.."
abbrev-alias -g "....."="../../../.."
abbrev-alias -g "......"="../../../../.."
abbrev-alias -g "......."="../../../../../.."
abbrev-alias -g "........"="../../../../../../.."
abbrev-alias -g "........."="../../../../../../../.."
abbrev-alias -g ".........."="../../../../../../../../.."
abbrev-alias -g "..........."="../../../../../../../../../.."
abbrev-alias -g "............"="../../../../../../../../../../.."
abbrev-alias -g "............."="../../../../../../../../../../../.."
abbrev-alias -g ".............."="../../../../../../../../../../../../.."
#-----------------------------------#

#---# Arch-Specific #---#
if [[ -e /usr/bin/pacman ]]; then
	alias -g pacman="sudo pacman"
	abbrev-alias -g paci="pacman -S"
	abbrev-alias -g pacq="pacman -Ss"
fi
#-----------------------#

#---# Ubuntu/Debian-Specific #---#
if [[ -e /usr/bin/apt-get ]]; then
	alias apt="sudo apt"
	abbrev-alias apti="apt install"
	abbrev-alias apts="apt search"
	abbrev-alias aptr="apt remove"
	abbrev-alias aptp="apt purge"
	alias apt-get="sudo apt-get"
	alias dpkg="sudo dpkg"
	if [[ -e /usr/bin/snap ]]; then
		alias update="sudo apt update && sudo apt upgrade && sudo snap refresh && sudo apt autoremove && sudo apt autoclean"
             else alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean"
	 fi
fi
#------------------------#

if [[ -e /usr/bin/snap ]]; then alias snap="sudo snap"; fi #snap alias

#---# General aliases #---#
alias visudo="sudo visudo"
abbrev-alias -g s="sudo"
abbrev-alias -g md="mkdir -pv"
function mdc(){ mkdir -pv $1 && cd $1 }
alias l="ls --color=always --group-directories-first"
alias ll="ls -lh --color=always --group-directories-first"
alias lla="ls -lah --color=always --group-directories-first"
alias ls="ls --color=always --group-directories-first"
alias lsl="ls -lh --color=always --group-directories-first"
alias lsla="ls -lah --color=always --group-directories-first"
alias e="exa --group-directories-first"
alias ee="exa -l --group-directories-first"
alias eea="exa -la --group-directories-first"
abbrev-alias -g rmr="rm -r"
abbrev-alias -g rmrf="rm -rf"
alias beep="echo -e '\a'"
abbrev-alias -g v="nvim"
abbrev-alias -g V="sudo -e"
abbrev-alias S="sudo systemctl"
abbrev-alias Su="systemctl --user"
abbrev-alias -f D="pwd"
alias config="/usr/bin/git --git-dir=$HOME/.env/ --work-tree=$HOME"
#-------------------------#

#---# CPU governor and power management #---#
if [[ -e /usr/bin/cpupower ]]; then
	alias cpumax="sudo cpupower frequency-set -g performance"
	alias cpumin="sudo cpupower frequency-set -g powersave"
	alias cpuclk="sudo cpupower frequency-info"
  else
	echo "cpupower not present"
 fi
if [[ -e /usr/sbin/powertop ]]; then
	alias powertop="sudo powertop"
 fi
#------------------------------#

#---# Bumblebee-system specific #---#
if [[ -e /usr/bin/optirun ]]; then
	alias nvidia-settings="optirun -b none nvidia-settings -c :8"
	alias nvidia-smi="optirun nvidia-smi"
	alias ivo="intel-virtual-output"
	fi
#-----------------------------------#

#---# Nvidia-prime system specific #---#
if [[ -e /usr/bin/nvidia-xrun  ]]; then
	abbrev-alias stxin="startx"
	abbrev-alias stxnv="nvidia-xrun i3"
fi
#--------------------------------------#

#---# Jewe's autoclicker #---#
	[[ $DISPLAY ]] && alias rightclicker="autoclicker --mc true --mid $(xinput | grep -i "mx master" | head -n1 | cut -f2 | cut -d= -f2) --bid 8 --btp Right"; alias leftclicker="autoclicker --mc true --mid $(xinput | grep -i "mx master" | head -n1 | cut -f2 | cut -d= -f2) --bid 9 --btp Left"
#----------------------------#

#Mia's Unilookup thingy
function ulookup() { echo $1 | unilookup }

#cd and ls
function list_all() {
    emulate -L zsh
    exa
}

chpwd_functions=(${chpwd_functions[@]} "list_all")

#git aliases
function gac(){git add . && git commit -m "$*"}
function gacp(){git add . && git commit -m "$*" && git push --quiet & }
abbrev-alias -g gp"git push --quiet"
function vf(){ fzf | xargs -r -I % $EDITOR % }

