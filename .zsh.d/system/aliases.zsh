# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`

if command -v gls >/dev/null 2>&1; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

if command -v bat >/dev/null 2>&1; then
  alias cat="bat"
fi

# Colorls alias
alias lc="colorls -A --group-directories-first"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

alias k9="killall -9"

# see https://github.com/fcambus/ansiweather for installation anc customization
alias we="ansiweather"

alias lt="localtunnel"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Get week number
alias week='date +%V'

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# if pbcopy is not available, but wl-copy is -> alias
command -v pbcopy > /dev/null || command -v wl-copy > /dev/null && alias pbcopy=wl-copy
# if pbpaste is not available, but wl-paste is -> alias
command -v pbpaste > /dev/null || command -v wl-paste > /dev/null && alias pbpaste=wl-paste

# alias ssh to use a standard TERM
#
alias ssh="TERM=xterm-256color ssh"
