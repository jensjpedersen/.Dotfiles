



" pacman ctags - required for tagslist
" aur yc 

call plug#begin('~/.vim/plugged')
"Plug 'tmhedberg/SimpylFold' " bedre folding
"Plug 'vim-scripts/indentpython.vim' " intendation
"Plug 'vim-syntastic/syntastic'		" syntax checker
"Plug 'nvie/vim-flake8'			" syntac style checher python
" Colorscheme
Plug 'morhetz/gruvbox' 
Plug 'jnurmine/Zenburn'  " colorscheme
Plug 'altercation/vim-colors-solarized' " colorscheme

"Plug 'frazrepo/vim-rainbow'	 " differnet color bracets - problemer med
"markdown conceal
"Plug 'jiangmiao/auto-pairs'  	 " auto paris bracets,  (å) funker ikke,
"kollapser linje

Plug 'itchyny/lightline.vim'	 " Lightline
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" super search
Plug 'junegunn/fzf.vim'					" super search
Plug 'mbbill/undotree'
Plug 'francoiscabrol/ranger.vim' " ranger
Plug 'lervag/vimtex'		 " Latex
Plug 'vimwiki/vimwiki'		 " vimwiki

" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}				" markdown preview
Plug 'ervandew/supertab'    " supertab (make YCM compatible with UltiSnips)
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

call plug#end()


syntax on
set nu 			   "line no
set clipboard=unnamedplus  " sys cipboard
set hlsearch		   " higlight search
set incsearch          " incremental search

" backup
set noswapfile
set undodir=~/.vim/undodir     " folder for undoo tree
set undofile                   " folder for undoo tree

" indenting
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"set nowrap
    
    

set laststatus=2	   " lightline

let mapleader = " "


" ycm settings
set completeopt-=preview                " Hides preview window
"let g:ycm_use_utisnips_completer = 0
"let g:ycm_add_pewview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" Snippets



" Latex settings
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"let conceallevel=1
"let g:tex_conceal='abdmg'

"vim wiki settings
set nocompatible
filetype plugin on
"syntax on   		" already set

" vim markdown settings
"set conceallevel=2

"Remappings


"Exit search
nnoremap <silent> <esc><esc> :noh<return><esc>

"fzf mappings
nnoremap <leader>p :Files<return>
nnoremap <leader>r :Rg<return>
nnoremap <leader>g :BLines<return>
nnoremap <leader>e :History:<return>

"go to def, go back
nnoremap <silent> <leader>v  :YcmCompleter GoTo<CR>
nnoremap <leader>b '' 

" Undo tree
nnoremap <silent> <leader>u  :UndotreeToggle<CR>

" Taglist
nnoremap <leader>t  :TlistToggle<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix 

" python higlighting
"let python_highlight_all=1

" Color-scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set background=dark
  colorscheme gruvbox
endif



