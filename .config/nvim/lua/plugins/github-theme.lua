present, ghtheme = pcall(require, "github-theme")
if not present then return end

local groups = {
	github_light = {
		Whitespace = { fg = '#BBBBBB' },
	}
}

ghtheme.setup({
	groups = groups,
})

vim.cmd('colorscheme github_light')
