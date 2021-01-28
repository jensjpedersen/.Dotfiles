"map pacman ctags - required for tagslist
"aur yc 
"
" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox' 
Plug 'itchyny/lightline.vim'	 " Lightline
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" super search
Plug 'junegunn/fzf.vim'					" super search
Plug 'mbbill/undotree'
Plug 'vifm/vifm.vim'
Plug 'lervag/vimtex'		 " Latex
Plug 'vimwiki/vimwiki'		 " vimwiki
Plug 'ervandew/supertab'    " supertab (make YCM compatible with UltiSnips)
" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim' " html
Plug 'tpope/vim-fugitive' " git plugin
Plug 'christoomey/vim-tmux-navigator' "Navigation between vim and tmux
Plug 'benmills/vimux' "vim tmux compatibility
Plug 'ap/vim-css-color' "Show hex colors
call plug#end()

set nocompatible
filetype plugin on
syntax on

set nu 			   "line no
set clipboard=unnamedplus  " sys cipboard
set hlsearch		   " higlight search
set incsearch          " incremental search
set ignorecase 
set smartcase           " case sensitive if upper keys 
set relativenumber

" backup
set noswapfile
set undodir=~/.vim/undodir     " folder for undoo tree
set undofile                   " folder for undoo tree

" indenting
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
"set textwidth=79
set nowrap  

set timeoutlen=1000 ttimeoutlen=0 " Fix delay on escape  

" Color-scheme
let g:gruvbox_guisp_fallback = "bg"     " spellcheker marking
set background=dark
colorscheme gruvbox 

set laststatus=2	   " lightline

let mapleader = " "
let maplocalleader = "," 

" Latex specific settings
autocmd BufNewFile,BufRead *.tex 
   \ set textwidth=79 |
   \ setlocal spell spelllang=en,nb

autocmd BufNewFile,BufRead *.md
   \ set textwidth=79 |

autocmd BufNewFile,BufRead *.tsv 
    \ set shiftwidth=20 | 
    \ set softtabstop=20 | 
    \ set tabstop=20 

" Load markdown in calcurse
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

" ========================= vimwiki settings =========================
" Get ultisnips to work with vimwiki
let g:vimwiki_table_mappings = 0
" markdown as dfault syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" ycm settings
set completeopt-=preview                " Hides preview window
let g:ycm_add_pewview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" enable ycm for markdown files
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" enable ycm for latex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme


" Latex settings
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
let conceallevel=1
let g:tex_conceal='abdmg'


" ==================== Keybindings ================================
" Compile and preview markdown
nnoremap <localleader>mm :w<CR>:!pandoc % -t latex -o %:r.pdf <CR>
nnoremap <localleader>mv :w<CR>:silent !mupdf %:r.pdf & <CR>

" Run python
nnoremap <localleader>pr :w<CR>:!python %<CR>

"Exit search
nnoremap <silent> <esc><esc> :noh<return><esc>

" fzf mappings
nnoremap <leader>p :Files<return>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>g :BLines<return>
nnoremap <leader>h :History<CR>

" Vifm 
nnoremap <leader>f :Vifm<CR>

" vimux mappings
nnoremap <Leader>vp :w<CR>:VimuxPromptCommand<CR>
nnoremap <Leader>vl :w<CR>:VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vc :VimuxInterruptRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>


"go to def
nnoremap <silent> <leader>d  :YcmCompleter GoTo<CR>
"nnoremap <leader>b '' 

" Undo tree
nnoremap <silent> <leader>u  :UndotreeToggle<CR>

" Taglist
nnoremap <leader>t  :TlistToggle<CR>
let Tlist_WinWidth = 40

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" Auto closing bracets
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a





