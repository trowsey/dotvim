vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.stdpath('config') .. '/lls/bin'

local nvim_lspconfig = require('lspconfig')
if vim.fn.executable('clangd') == 1 then
		nvim_lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {'clangd', '--header-insertion=never'},
		})
end
if vim.fn.executable('lua-language-server') == 1 then
		local runtime_path vim.split(package.path, ';', {})
		table.insert(runtime_path, 'lua/?.lua')
		table.insert(runtime_path, 'lua/?/init.lua')

		nvim_lspconfig.lua_ls.setup({
				settings = {
						Lua = {
								diagnostics = {
										globals = {'vim'},
										disable = {'param-type-mismatch', 'undefiend-field'},
								},
								runtime = {
										path = runtime_path,
										version = 'LuaJIT',
								},
								telemetry = {
										enable = false,
								},
								worspace = {
										checkThirdParty = false,
										library = {
												vim.env.VIMRUNTIME,
										},
								},
						},
				},
		})
end
