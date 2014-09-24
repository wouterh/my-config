if test -f ~/.fishmarks/marks.fish
	. ~/.fishmarks/marks.fish
end

for file in (ls ./variables/)
	. ./variables/$file
end
