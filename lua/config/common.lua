--colors
--require('tokyonight').setup({
--	style = "night",
--	transparent = true,
--	terminal_colors = true,
--	styles = {
--		sidebars = "transparent",
--		floats = "transparent",
--	}
--})

vim.cmd.colorscheme('tokyonight')

-- leader
vim.g.mapleader = ' '

--options
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false

