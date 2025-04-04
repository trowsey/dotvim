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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--options
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.mouse = v
vim.opt.termguicolors = true

-- split keymaps
vim.keymap.set('n', '<a-=>', '<c-w><c-=>')
vim.keymap.set('n', '<a-h>', '<c-w><')
vim.keymap.set('n', '<a-j>', '<c-w>+')
vim.keymap.set('n', '<a-k>', '<c-w>-')
vim.keymap.set('n', '<a-l>', '<c-w>>')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')


if vim.fn.has('win32') == 1 then
	vim.opt.fileformats = {'dos'}
else
	vim.opt.fileformats = {'unix', 'dos', 'mac'}
end
