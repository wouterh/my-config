#!/usr/bin/fish

mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/fish/variables

ln -s $PWD/config.fish ~/.config/fish/config.fish
for f in (ls functions)
	ln -s $PWD/functions/$f ~/.config/fish/functions/$f
end

for f in (ls variables)
	ln -s $PWD/variables/$f ~/.config/fish/variables/$f
end
