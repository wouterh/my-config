-- Install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

return require("packer").startup(function()
	use "wbthomason/packer.nvim"          -- https://github.com/wbthomason/packer.nvim

	-- Look and Feel
	use ({ 'projekt0n/github-nvim-theme' })

	-- Keybindings help
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- Productivity
	use { "romgrk/barbar.nvim", wants = "nvim-tree/nvim-web-devicons" } -- https://github.com/romgrk/barbar.nvim
	use "nvim-lualine/lualine.nvim"       -- https://github.com/nvim-lualine/lualine.nvim
	use 'WhoIsSethDaniel/lualine-lsp-progress.nvim'

	use {
		"nvim-tree/nvim-tree.lua",          -- https://github.com/nvim-tree/nvim-tree.lua
		requires = {
			"nvim-tree/nvim-web-devicons",    -- https://github.com/nvim-tree/nvim-web-devicons
		},
	}
	use {
		"nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
		run = "make",
	}
	use {
		"nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
		requires = {
			"nvim-lua/plenary.nvim",
		},
		branch = "0.1.x",
	}
	use {	"BurntSushi/ripgrep" }
	use { 'numToStr/Comment.nvim' }

	-- Development
	use "neovim/nvim-lspconfig"
	use "lewis6991/gitsigns.nvim"             -- https://github.com/lewis6991/gitsigns.nvim
	use {
		"nvim-treesitter/nvim-treesitter",      -- https://github.com/nvim-treesitter/nvim-treesitter
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use {
		"windwp/nvim-autopairs",
	}
	-- Golang
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommended if need floating window support

	-- Null LS for:
	-- - prettier for JS/TS/JSON etc
	-- - eslint
	use {
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}

	-- Markdown
	use {
		"iamcco/markdown-preview.nvim", 
		run = "cd app && npm install", 
		ft = { "markdown" }, 
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
