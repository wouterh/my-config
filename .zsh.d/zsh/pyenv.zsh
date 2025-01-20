# Load pyenv automatically by appending
# the following to
# ~/.zprofile (for login shells)
# and ~/.zshrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 2>&1 > /dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi
