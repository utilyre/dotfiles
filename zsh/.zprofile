#!/bin/zsh

export XDG_DOCUMENTS_HOME="$HOME/Documents"
export XDG_DOWNLOADS_HOME="$HOME/Downloads"
export XDG_MUSIC_HOME="$HOME/Music"
export XDG_PICTURES_HOME="$HOME/Pictures"
export XDG_PUBLIC_HOME="$HOME/Public"
export XDG_VIDEOS_HOME="$HOME/Videos"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$PATH:$HOME/.local/bin"

export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config.ini"
export ZCOMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export LF_CACHE_DIR="$XDG_CACHE_HOME/lf"
export ZDIR="$XDG_DATA_HOME/zsh"
export PASSWORDS_DIR="$XDG_DATA_HOME/passwords"
export HISTFILE="$XDG_STATE_HOME/shell"
export LESSHISTFILE="$XDG_STATE_HOME/less"
export WALIRESFILE="$XDG_STATE_HOME/wali"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauthority"

export MANPAGER="/bin/nvim +Man\!"
export MANWIDTH="1024"

export LS_COLORS="no=0;37:fi=0;37:ex=0;32:so=0;35:do=0;35:pi=0;33:ln=0;36:or=0;31:mi=0;31:di=1;34:tw=1;32:ow=1;32:st=1;32:cd=1;33:bd=1;37"
export LF_ICONS="no=:fi=:ex=:so=:do=:pi=:ln=:or=:mi=:di=:tw=:ow=:st=:cd=:bd="

printenv | awk --field-separator="=" -- "(\$1 ~ /^XDG_.+_HOME\$/) { print \$2 }" | xargs --delimiter="\n" mkdir --parents --
startx "$XDG_CONFIG_HOME/x11/xinitrc"
