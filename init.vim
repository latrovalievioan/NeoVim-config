:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set termguicolors

" PLUGGINS
call plug#begin()

Plug 'https://github.com/rafi/awesome-vim-colorschemes' "colorschemes
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf file search
Plug 'junegunn/fzf.vim' "fzf file search
Plug 'preservim/nerdtree' "nerd-tree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'APZelos/blamer.nvim'
Plug 'https://github.com/vim-airline/vim-airline'


call plug#end()

"colorscheme
colorscheme gruvbox

" fzf remaps
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg 

"nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>

"coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]


" terminal
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

map <F2> :call Term_toggle(10)<CR>
tmap <F2> <C-\><C-n> <CR>
tmap <ScrollWheelUp> <C-W>N<ScrollWheelUp>
