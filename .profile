[ -e $HOME/.config/`hostname`.profile ] && . $HOME/.config/`hostname`.profile

export EDITOR=vim
export GOPATH=$HOME/Development/go
export PATH=$HOME/bin/$(hostname):$HOME/bin/$(uname -s):$HOME/bin/$(uname -m):$HOME/bin:$GOPATH/bin:$PATH
export XDG_SCREENSHOTS_DIR=$HOME/tmp
export XDG_CONFIG_HOME=$HOME/.config

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

