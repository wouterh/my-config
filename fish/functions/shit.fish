function shit --description "Execute the previous command with sudo"
	eval command sudo $history[1]
end
