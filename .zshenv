export PATH=~/bin/$(hostname):~/bin/$(uname -s):~/bin/$(uname -m):~/bin:$PATH
export EDITOR=vim
export LANG=nl_BE.UTF-8
export GOPATH=~/Development/go

[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile
