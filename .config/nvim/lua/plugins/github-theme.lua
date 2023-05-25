present, ghtheme = pcall(require, "github-theme")
if not present then return end

local groups = {
	all = {
		Whitespace = { fg = '#bbbbbb' },
	}
}

ghtheme.setup({
	groups = groups,
})

vim.cmd('colorscheme github_light_default')
