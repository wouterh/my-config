if test -f ~/.fishmarks/marks.fish
	. ~/.fishmarks/marks.fish
end

for file in ~/.config/fish/variables/*
	. $file
end
