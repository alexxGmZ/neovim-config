let mapleader = " "

" fzf
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

" ALE
nmap ]a :ALENextWrap <CR>
nmap [a :ALEPreviousWrap <CR>
nmap ]A :ALELast <CR>
nmap [A :ALEFirst <CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
nmap <leader>vst :vsplit term://$SHELL <CR>
nmap <leader>spt :split term://$SHELL <CR>
nmap <leader>tnt :tabnew term://$SHELL <CR>

" tagbar toggle
nmap <F8> :TagbarToggle <CR>
nmap <leader>t :TagbarToggle <CR>

" Remove Search Highlight
map <esc> :noh <CR>

" auto-complete brackets
" inoremap { {}<Esc>ha
" inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha

nmap <leader>qq :quit <CR>
nmap <leader>qa :quitall <CR>
nmap <leader>ww :write <CR>
nmap <leader>wq :wq <CR>
nmap <leader>wa :wa <CR>

" nvim-tree
nmap <leader>F :NvimTreeToggle <CR>
nmap <leader><leader>f :NvimTreeToggle <CR>
nmap <F6> :NvimTreeToggle <CR>
