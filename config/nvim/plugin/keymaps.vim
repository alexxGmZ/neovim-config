let mapleader = " "
" fzf
	nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

" ALE
	nmap ]a :ALENextWrap<CR>
	nmap [a :ALEPreviousWrap<CR>
	nmap ]A :ALELast<CR>
	nmap [A :ALEFirst<CR>

" Terminal
	tnoremap <Esc> <C-\><C-n>

" nerdtree toggle
	nmap <F6> :NERDTreeToggle<CR>

" tagbar toggle
	nmap <F8> :TagbarToggle<CR>

" Remove Search Highlight
	map <esc> :noh <CR>

" auto-complete brackets
	inoremap { {}<Esc>ha
	inoremap ( ()<Esc>ha
	inoremap [ []<Esc>ha
	inoremap " ""<Esc>ha
	inoremap ' ''<Esc>ha

