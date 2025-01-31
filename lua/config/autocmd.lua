vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile',}, {
	pattern = '*.cpp',
	command = 'set filetype=cpp'
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile',}, {
	pattern = 'CMakeLists.txt',
	command = 'set filetype=cmake'
})
