local opt = vim.opt

-- Personal configuration
opt.sm = true
opt.hls = true
opt.incsearch = true
opt.mouse = 'na'
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes' 

-- Indentatie
opt.shiftwidth = 2
opt.formatoptions='tcqr'

-- How to show spaces and tabs in list mode
opt.listchars = 'tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:·'

-- Use space as leader key
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Execute something in the shell
map('n', '<F2>', ':!', {})
map('i', '<F2>', '<ESC>:!', {})
-- Toggle list mode
map('n', '<F8>', ':set list!<CR>', {})
map('i', '<F8>', '<ESC>:set list!<CR>a', {})

-- Faster grep
local function add(value, str, sep)
  sep = sep or ','
  str = str or ''
  value = type(value) == 'table' and table.concat(value, sep) or value
  return str ~= '' and table.concat({ value, str }, sep) or value
end

-- Use the primary selection clipboard for the unnamed register
opt.clipboard = 'unnamed'
-- Shortcuts to copy to/paste from the system clipboard
map('v', '<leader>y', '"+y', opts)
map('n', '<leader>Y', '"+yg_', opts)
map('n', '<leader>y', '"+y', opts)
map('n', '<leader>yy', '"+yy', opts)
map('n', '<leader>p', '"+p', opts)
map('n', '<leader>P', '"+P', opts)
map('v', '<leader>p', '"+p', opts)
map('v', '<leader>P', '"+P', opts)

if vim.fn.executable('rg') then
  vim.o.grepprg =
      [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
  vim.o.grepformat = add('%f:%l:%c:%m', vim.o.grepformat)
end
