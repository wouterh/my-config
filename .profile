[ -e $HOME/.config/`hostname`.profile ] && . $HOME/.config/`hostname`.profile

PATH_EXTRAS=$HOME/bin/$(uname -s):$HOME/bin/$(uname -m):$HOME/bin

[ -e /etc/os-release ] && PATH_EXTRAS=$HOME/bin/$(source /etc/os-release && echo ${ID}):$PATH_EXTRAS

PATH_EXTRAS=$HOME/bin/$(hostname):$PATH_EXTRAS

export EDITOR=vim
export GOPATH=$HOME/Development/go
PATH_EXTRAS=$PATH_EXTRAS:$GOPATH/bin
export XDG_SCREENSHOTS_DIR=$HOME/tmp
export XDG_CONFIG_HOME=$HOME/.config

export PATH=$PATH_EXTRAS:$PATH

# locale settings
LANG=en_US.UTF-8
LC_CTYPE=nl_BE.UTF-8
LC_NUMERIC=nl_BE.UTF-8
LC_TIME=nl_BE.UTF-8
LC_COLLATE=nl_BE.UTF-8
LC_MONETARY=nl_BE.UTF-8
LC_MESSAGES=en_US.UTF-8
LC_PAPER=nl_BE.UTF-8
LC_NAME=nl_BE.UTF-8
LC_ADDRESS=nl_BE.UTF-8
LC_TELEPHONE=nl_BE.UTF-8
LC_MEASUREMENT=nl_BE.UTF-8
LC_IDENTIFICATION=nl_BE.UTF-8

