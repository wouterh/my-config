-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lsp_cxx_hl_light_bg = true

-- Enable editorconfig
vim.g.editorconfig = true

-- Indentatie
vim.opt.shiftwidth = 2
vim.opt.formatoptions = "tcqr"
vim.opt.tabstop = 2

-- How to show spaces and tabs in list mode
vim.opt.listchars = "tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:·"

-- Do not hide anything
vim.opt.conceallevel = 0

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Execute something in the shell
map("n", "<F2>", ":!", {})
map("i", "<F2>", "<ESC>:!", {})
-- Toggle list mode
map("n", "<F8>", ":set list!<CR>", {})
map("i", "<F8>", "<ESC>:set list!<CR>a", {})

-- Always use prettier for files it supports
vim.g.lazyvim_prettier_needs_config = false

-- Do not copy to system clipboard by default
vim.opt.clipboard = ""
