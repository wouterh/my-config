function ctrlc -d "Copy stdin to the clipboard"
	command xsel -ib $argv
end
