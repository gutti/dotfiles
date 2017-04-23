"----------------------------------------------------------------------------
"set nocompatible
"set t_kb = 
"set t_kD = 

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))
  call dein#add('Shougo/dein.vim')
  call dein#add('gmarik/Vundle.vim')
  call dein#add('Shougo/neocomplcache')
  call dein#add('mattn/zencoding-vim')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('thinca/vim-quickrun')
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('itchyny/lightline.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('fatih/vim-go')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cp %s']}

syntax enable
set background=dark
colorscheme solarized
"colorscheme peachpuff

hi Pmenu guibg=#f5f5dc guifg=#000000
hi PmenuSel guibg=#0000ff guifg=#ffffff
hi PmenuSbar guibg=#aaaaaa
hi PmenuThumb guifg=#0000ff

"
noremap!  <BS>

"-----------------------------------------------------------------------------
"
"set autoindent
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre  *.bin let &binary =1
	autocmd BufReadPost * if &binary | silent %!xxd -g 1
	autocmd BufReadPost * set ft=xxd | endif
	autocmd BufWritePre * if &binary | %!xxd -r | endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END

"-----------------------------------------------------------------------------
"
set ignorecase
set smartcase
set wrapscan
set noincsearch

"-----------------------------------------------------------------------------
"
if has("syntax")
	syntax on
endif
set nonumber
set listchars=tab:\ \ 
set list
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showcmd
set showmatch
set hlsearch
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set foldmethod=marker
set backspace=indent,eol,start

"-----------------------------------------------------------------------------
"
map <F2> <ESC>:tabp<CR>
map <F3> <ESC>:tabn<CR>
map <F4> <ESC>:bw<CR>
nnoremap j gj
nnoremap k gk
map <kPlus> <C-W>+
map <kMinus> <C-W>-

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:user_emmet_settings = {
    \   'lang' : 'ja'
    \ }

" :Fmt などで gofmt の代わりに goimports を使う
let g:gofmt_command = 'goimports'

" Go に付属の plugin と gocode を有効にする
set rtp^=${GOROOT}/misc/vim
set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

" 保存時に :Fmt する
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4
au FileType go compiler go

let g:go_bin_path = expand("~/.go/bin")
set completeopt=menu,preview
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
