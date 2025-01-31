
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

