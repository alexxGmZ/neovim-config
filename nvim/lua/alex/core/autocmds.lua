vim.cmd([[
	fun! TrimWhitespace()
		let l:save = winsaveview()
		keeppatterns %s/\s\+$//e
		call winrestview(l:save)
	endfun

	augroup HANDSOME
		autocmd!
		autocmd BufWritePre * :call TrimWhitespace()

		" Terminal
		autocmd TermOpen * setlocal nonumber norelativenumber

	augroup END

	" augroup cdpwd
	" 	autocmd!
	" 	autocmd VimEnter * cd $PWD
	" augroup END
]])
