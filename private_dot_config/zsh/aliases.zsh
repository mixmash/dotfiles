# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#My custom aliases
alias k="rlwrap ./k"
alias q32='QHOME=~/q32 rlwrap -r ~/q32/l32/q'
alias q='QHOME=~/q rlwrap -r ~/q/l64/q'
alias developer='source /home/user/developer/config/config.profile; q /home/user/developer/launcher.q_ '
export PATH=/home/user/.nimble/bin:$PATH
alias fd=fdfind
alias bat=batcaalias bat=batcat
alias sl=ls
alias nv=nvim

alias restart-mouse="sudo rmmod psmouse ; sudo modprobe psmouse"
alias gifgen="~/gifgen/gifgen"

alias rm="trash"
alias ug="sudo apt -y update; sudo apt -y upgrade"
alias aptclean="sudo apt autoclean; sudo apt autoremove"

alias change_mac_address="./bashscripts/change_mac_address.sh"

alias x="xdg-open"
alias xci="xclip -selection clipboard"
alias xco="xclip -selection clipboard -o"
# Reset screen resolution
alias reset-resolution="xrandr -s 0"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

