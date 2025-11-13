
 --fzf lua
if vim.fn.executable('fzf') == 1 then
	local fzf_lua = require('fzf-lua')
	fzf_lua.setup({
		winopts = {
			preview = {
				cursorline = false;
			},
		},
	})

	local grep_opts = nil
	if vim.fn.has(win32) == 1 then
		grep_opts = {
			cmd = 'git grep --line-number --column --color=always'
		}
	end
	
	local live_grep = function()
		fzf_lua.live_grep(grep_opts)
	end

	local grep = function()
		fzf_lua.grep(grep_opts)
	end

	vim.keymap.set('n', '<leader>fb', fzf_lua.buffers)
	vim.keymap.set('n', '<leader>fg', fzf_lua.git_files)
	vim.keymap.set('n', '<leader>fh', fzf_lua.oldfiles)
	vim.keymap.set('n', '<leader>fl', fzf_lua.lines)
	vim.keymap.set('n', '<leader>fp', fzf_lua.grep)
	vim.keymap.set('n', '<leader>fs', fzf_lua.live_grep)
end

-- copilotchat.nvim
require('CopilotChat').setup({
    mappings = {
        jump_to_diff = { insert = '', normal = '' }, ---@diagnostic disable-line
        reset = { insert = '', normal = '' }, ---@diagnostic disable-line
    },
    resources = {
        'buffer',
        'selection',
    }
})

vim.keymap.set('n', '<leader>pc', vim.cmd.CopilotChatCommit)

vim.keymap.set({ 'n', 'v' }, '<leader>pd', vim.cmd.CopilotChatDocs)
vim.keymap.set({ 'n', 'v' }, '<leader>pe', vim.cmd.CopilotChatExplain)
vim.keymap.set({ 'n', 'v' }, '<leader>po', vim.cmd.CopilotChatOptimize)
vim.keymap.set({ 'n', 'v' }, '<leader>pr', vim.cmd.CopilotChatReview)
vim.keymap.set({ 'n', 'v' }, '<leader>pt', vim.cmd.CopilotChatToggle)


-- vim-easy-align
vim.g.easy_align_ignore_groups = {}
vim.keymap.set('n', 'ga', '<plug>(EasyAlign)')
vim.keymap.set('v', '<cr>', '<plug>(EasyAlign)')

-- revolver
require('revolver').setup({'.c', '.cpp', '.h', '.hpp', '.inl'})
vim.keymap.set('n', 'gfs', vim.cmd.Revolve)

-- argonaut.nvim
local function argonaut_setup(reload)
    if reload then
        vim.cmd.ArgonautReload()
    end
    require('argonaut').setup({
        by_filetype = {
            c = {brace_last_wrap = false},
            cpp = {brace_last_wrap = false},
        },
    })
end

vim.keymap.set({'x', 'o'}, 'ia', ':<C-u>ArgonautObject inner<cr>', {noremap = true, silent = true})
vim.keymap.set({'x', 'o'}, 'aa', ':<C-u>ArgonautObject outer<cr>', {noremap = true, silent = true})
vim.keymap.set({'x', 'o', 'n'}, '<leader>n', ':<C-u>ArgonautObject next<cr>', {noremap = true, silent = true})
vim.keymap.set({'x', 'o', 'n'}, '<leader>p', ':<C-u>ArgonautObject previous<cr>', {noremap = true, silent = true})

vim.keymap.set('n', '<leader>a', function() argonaut_setup(true) vim.cmd.ArgonautToggle() end)
vim.keymap.set('n', '<leader>o', function() argonaut_setup(true) vim.cmd.ArgonautReflow() end)

argonaut_setup(false)

-- nvim-tree
-- OR setup with some options
local nvim_tree = require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>') 


-- guid.nvim
require('guid').setup({ comma_space = true })
vim.keymap.set({'x', 'o'}, 'ag', ':<c-u>GuidObject<cr>')
