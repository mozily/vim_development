set number " set line number
set nocompatible " be iMproved, required
set title " show title
set wmnu " tab auto complete list
set tabstop=4 " tab size 4
set shiftwidth=4 " auto indent size 4
set clipboard=unnamedplus " using cntl+c copy to clipboard
set mouse=a " using mouse
set autowrite " auto save when file changes
set backspace=indent,eol,start " backspace working
set paste " copy & paste
set autoindent
syntax on

" CYM option
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/bin/python3'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_warning_symbol = '>*'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_filetype_blacklist = {'tagbar' : 1, 'qf' : 1,'notes' : 1}

" NERDTree option
let g:NERDTreeMouseMode=3 " change view when NERDTree file click
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

filetype off " required

" set tue runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add plugins -----------------------------------------
Plugin 'vim-airline/vim-airline' " progress bar
Plugin 'scrooloose/nerdtree' "file tree
Plugin 'airblade/vim-gitgutter' " code change history
Plugin 'scrooloose/syntastic' " code syntax check
Plugin 'tpope/vim-fugitive' " vi using git
Plugin 'fatih/vim-go' " vim go
Plugin 'Valloric/YouCompleteMe' " ycm (auto complete)
Plugin 'majutsushi/tagbar' " tagbar
Plugin 'stanangeloff/php.vim' " php 7.x

" shortcut setting ------------------------------------
" toggle NERDTree
map <F1> :NERDTreeToggle<cr>
" toggle Tagbar
map <F2> :TagbarToggle<cr>
" run
autocmd filetype php map <F5> :!/usr/bin/php %<cr>
autocmd filetype go map <F5> :GoRun<cr>
" save
map <C-S> :w!<cr>
" exit
map <F10> :q!<cr>

call vundle#end() " required

filetype plugin indent on " required