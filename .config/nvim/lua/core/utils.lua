local augroup = vim.api.nvim_create_augroup('LspFormat', {})
local lsp_on_attach = function(client, bufnr)
	    if client.supports_method("textDocument/formatting") then
	        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	        vim.api.nvim_create_autocmd("BufWritePre", {
	            group = augroup,
	            buffer = bufnr,
	            callback = function()
	                vim.lsp.buf.format({ async = false })
	            end,
	        })
	    end
	end

return {
	lsp_on_attach = lsp_on_attach
}
