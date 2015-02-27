function ctrlv -d "Paste the clipboard to stdout"
	command xsel -ob $argv
end
