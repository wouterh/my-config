set -g __fish_git_prompt_show_informative_status true
set -g __fish_git_prompt_showcolorhints true

function fish_prompt --description 'Write out the prompt'
	
	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	if not set -q __fish_prompt_cwd
		set -g __fish_prompt_cwd (set_color $fish_color_cwd)
	end

	if not set -q __fish_prompt_date
		set -g __fish_prompt_date (set_color purple)
	end

	echo -n -s "$__fish_prompt_date" (date "+%H:%M:%S") "$__fish_prompt_normal" (__fish_git_prompt) " $__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" '> '

end
