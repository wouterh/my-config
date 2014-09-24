if status --is-interactive 
	if test -x /usr/bin/lesspipe
		set -x LESSOPEN "| /usr/bin/lesspipe %s"
		set -x LESSCLOSE "/usr/bin/lesspipe %s %s"
	end
end
