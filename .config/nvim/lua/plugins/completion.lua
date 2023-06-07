vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = { recommended = false }, -- needed to make nvim-autopairs work
}

local present, coq = pcall(require, 'coq')
if not present then return end

-- add recommended keymaps that don't affect nvim-autopairs
local remap = vim.api.nvim_set_keymap
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
