local setup, null_ls = pcall(require, "null-ls")
if not setup then return end

local util = require('core.utils')

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
		}),
		null_ls.builtins.formatting.prettier,
	},
	on_attach = util.lsp_on_attach,
})
