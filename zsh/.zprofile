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
export XDG_BIN_HOME="$HOME/.local/bin"

export X11_CONFIG="$XDG_CONFIG_HOME/x11"
export XRANDR_CONFIG="$XDG_CONFIG_HOME/user/xrandrrc"
export UNSEEN_CONFIG="$XDG_CONFIG_HOME/user/unseenrc"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/user/gitrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NULL_CONFIG="$XDG_CONFIG_HOME/user/nullrc"
export LF_CACHE="$XDG_CACHE_HOME/lf"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
export NPM_CACHE="$XDG_CACHE_HOME/npm"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GUARD_DATA="$XDG_DATA_HOME/guard"
export UNSEEN_DATA="$XDG_DATA_HOME/unseen"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export ZSH_DATA="$XDG_DATA_HOME/zsh"
export NPM_DATA="$XDG_DATA_HOME/npm"
export WALIHISTFILE="$XDG_STATE_HOME/wali"
export HISTFILE="$XDG_STATE_HOME/shell"
export LESSHISTFILE="$XDG_STATE_HOME/less"
export PATH="$XDG_BIN_HOME:$NPM_DATA/bin:$PATH"
export XAUTHORITY="$XDG_RUNTIME_DIR/xauthority"
export LF_RUNTIME="$XDG_RUNTIME_DIR/lf"
export NPM_RUNTIME="$XDG_RUNTIME_DIR/npm"
export NVIM_RUNTIME="$XDG_RUNTIME_DIR/nvim"

export PAGER="/bin/less --use-color --raw-control-chars --color=\"P+kg\" --color=\"S+ky\" --color=\"d+b\" --color=\"u+m\""
export EDITOR="/bin/nvr --remote-wait-silent"

export LS_COLORS="no=0;37:fi=0;37:ex=0;32:so=0;35:do=0;35:pi=0;33:ln=0;36:or=0;31:mi=0;31:di=1;34:tw=1;32:ow=1;32:st=1;32:cd=1;33:bd=1;37"
export LF_ICONS="no=:fi=:ex=:so=:do=:pi=:ln=:or=:mi=:di=:tw=:ow=:st=:cd=:bd="

printenv | awk --field-separator="=" -- "(\$1 ~ /^XDG_.+_HOME\$/) { print \$2 }" | xargs --delimiter="\n" mkdir --parents --
startx "$X11_CONFIG/xinitrc"
