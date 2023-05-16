present, ghtheme = pcall(require, "github-theme")
if not present then return end

vim.cmd('colorscheme github_light')
