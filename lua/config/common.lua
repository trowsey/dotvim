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
vim.opt.shell = "pwsh"

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

-- terminal keymaps
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- Open terminal in the current buffer's file directory
local function open_term_in_buf_dir(split)
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then dir = vim.loop.cwd() end
  dir = vim.fn.fnameescape(dir)

  if split == "v" then
    vim.cmd("vsplit")
  else
    vim.cmd("split")
  end

  vim.cmd("lcd " .. dir)
  vim.cmd("terminal")
  vim.cmd("startinsert")
end
-- Keybindings:
-- <leader>tv → vertical split terminal
vim.keymap.set("n", "<leader>tv", function() open_term_in_buf_dir("v") end,
  { noremap = true, silent = true, desc = "Terminal vsplit in buffer file dir" })

-- <leader>th → horizontal split terminal
vim.keymap.set("n", "<leader>th", function() open_term_in_buf_dir("h") end,
  { noremap = true, silent = true, desc = "Terminal hsplit in buffer file dir" })


-- Whitespace based on OS
if vim.fn.has('win32') == 1 then
	vim.opt.fileformats = {'dos'}
else
	vim.opt.fileformats = {'unix', 'dos', 'mac'}
end
