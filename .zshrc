export TERM="st-256color"
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

source ~/.zsh/completions.zsh

source ~/.zplug/init.zsh

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-completions", as:plugin
zplug "zsh-users/zsh-syntax-highlighting", as:plugin
# zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "zsh-users/zsh-history-substring-search"
zplug "momo-lab/zsh-abbrev-alias"
zplug "hlissner/zsh-autopair"

zplug load

abbrev-alias --init

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/private_aliases.zsh
source ~/.zsh/shortcuts.zsh

#Powerlevel9k configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=">"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=">"
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
