export PATH=~/bin/$(hostname):~/bin/$(uname -s):~/bin/$(uname -m):~/bin:$PATH
export EDITOR=vim
export GOPATH=~/Development/go

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

[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile
