if [[ -d "$HOME/.zcompcache" ]]
then
	export ZSH_CACHE_DIR=$HOME/.zcompcache
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# We'll leave this blank and use the async Pure prompt
ZSH_THEME=""

# Pure Prompt Customization
PURE_PROMPT_SYMBOL="○"
#PURE_PROMPT_DIR_TRUNC_PREFIX="…/"
PURE_PROMPT_DIR_TRUNC="3"
PURE_PROMPT_GIT_SYMBOL="\ue725 "
PURE_PROMPT_KUBECONTEXT_SYMBOL="\ue7b2 "
PURE_PROMPT_KUBECONTEXT_SHOW=true
PURE_PROMPT_TERRAFORM_SYMBOL="\uf9fd"
# this isn't very useful, it just shows the version of the system go,
# not the one in go.mod
PURE_PROMPT_GOLANG_SHOW=false

# Comment following line if you do not want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(docker
				 docker-compose
				 extract
				 encode64
				 fast-syntax-highlighting
				 gitignore
				 git-extras
				 git-hubflow
				 git-it-on
				 iosctl
				 jj
				 oh-my-matrix
				 npm
				 react-native
				 zshmarks
				 zsh-brew-services
				 zsh-autosuggestions
				 zsh-completions)

# Load any cached paths upfront
if [[ -a $ZSH/cache/zsh_plugin_paths ]]; then
	source $ZSH/cache/zsh_plugin_paths
fi

if [[ ! -z "$FZF_BASE" ]]; then
	plugins+=('fzf')
fi

# only load alias tips when python is installed
if command -v python >/dev/null 2>&1; then
	plugins+=('alias-tips')
fi

# Load them all
source $ZSH/oh-my-zsh.sh

# your project folder that we can `c [tab]` to
export PROJECTS=~/Development

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi


# all of our zsh files
typeset -U config_files
config_files=($HOME/.zsh.d/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# Speeds up load time
DISABLE_UPDATE_PROMPT=true

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

# completion; use cache if updated within 24h
autoload -Uz compinit
setopt EXTENDEDGLOB
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit -d $HOME/.zcompdump;
else
  compinit -C;
fi;

unset config_files

export CC=/usr/bin/gcc

# Put local stuff that you want at the end of everything in here
if [[ -a ~/.localrc.late ]]; then
	source ~/.localrc.late
fi

# support autojump
if command -v autojump >/dev/null 2>&1; then
	. /usr/share/autojump/autojump.zsh
fi

export GIT_UNCOMMITTED="+"
export GIT_UNSTAGED="!"
export GIT_UNTRACKED="?"
export GIT_STASHED="$"
export GIT_UNPULLED="⇣"
export GIT_UNPUSHED="⇡"
export YARN_ENABLED=true

# Fix direcory autocompletion when using autosuggestions
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(expand-or-complete)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# Check for update of the dotfiles
#if [ "$DISABLE_AUTO_UPDATE" != "true" ]; then
#  env DOTFILES=$DOTFILES DISABLE_UPDATE_PROMPT=$DISABLE_UPDATE_PROMPT zsh -f $DOTFILES/tools/check_for_upgrade.sh
#fi

if [[ -a $HOME/.config/yarn/global/node_modules/.bin ]]; then
	export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

if [[ -a $HOME/.yarn/bin ]]; then
	export PATH="$HOME/.yarn/bin:$PATH"
fi

if [[ -a $HOME/.local/bin ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# Make ctrl-d exit the shell
unsetopt ignoreeof

# Setup our prompt
prompt_pure_setup
