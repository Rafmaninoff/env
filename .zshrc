export TERM="st-256color"

#enable colours
autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify
#vi mode
bindkey -v
export KEYTIMEOUT=1

source ~/.zsh/completions.zsh

source ~/.zplug/init.zsh

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-completions", as:plugin
zplug "zsh-users/zsh-syntax-highlighting", as:plugin
# zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "zsh-users/zsh-history-substring-search"
zplug "momo-lab/zsh-abbrev-alias"
zplug "hlissner/zsh-autopair"
zplug "sei40kr/zsh-fast-alias-tips", hook-build:"make"
zplug "Tarrasch/zsh-bd"

zplug load

abbrev-alias --init

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
[[ -f ~/.zsh/private_aliases.zsh ]] && source ~/.zsh/private_aliases.zsh
[[ -f ~/.zsh/shortcuts.zsh ]] && source ~/.zsh/shortcuts.zsh

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#select and edit a file in current directory
bindkey -s '^v' 'nvim $(fzf)^M'

#Powerlevel9k configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=">"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=">"
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


