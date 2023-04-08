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

		" autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
		" autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
		" autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
		" autocmd FileType markdown MarkdownPreview
	augroup END

	" augroup cdpwd
	" 	autocmd!
	" 	autocmd VimEnter * cd $PWD
	" augroup END
]])
