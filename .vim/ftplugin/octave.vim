nnoremap <leader>s :!curl cht.sh/matlab/

" Vimux settings
nnoremap <Leader>vp :w<CR>:VimuxPromptCommand<CR>
nnoremap <Leader>vl :w<CR>:VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vk :VimuxInterruptRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>
nnoremap <leader>vj :w<CR>:VimuxRunCommand("run " . bufname("%"))<CR>
nnoremap <leader>vc :w<CR>:VimuxRunCommand("clc")<CR>

" go to first instance of word / 
nnoremap <leader>d :norm *<CR> :vimgrep /<c-r>//g %<CR>
