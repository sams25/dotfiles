"This is my .vimrc file where I store the settings for my vim editor

let g:ycm_server_python_interpreter='/usr/bin/python'
""""""""""""""""""""""""""""""""""""""""""""
"Vundle stuff for vim plugin management

set nocompatible "We need vImproved, just vi won't do

filetype off "Because Vundle should have control of it

"To include Vundle into the run time path and intialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"List of plugin commands - must be in between vundle#begin and end.

Plugin 'VundleVim/Vundle.vim' "Let Vundle manage itself, required.
Plugin 'Valloric/YouCompleteMe' "For YouCompleteMe, an autocomplete plugin
Plugin 'fatih/vim-go' "For vim-go, a plugin for Go syntax

"All plugins must be declared before this
call vundle#end()
filetype plugin indent on "required for the plugins to have effect

"Brief help for vundle-
" :PluginList - lists configured plugins
" :PluginInstall - install pluggins; append '!' to update
" :PluginUpdate - another way of updating
" :PluginSearch foo - searches for foo
" :PluginClean - confirms removal of unused plugins

"See :h in vundle for more details
""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""Vim-LATEX-START"""""""""""""""""""
"This invokes Vim-Latex for every tex file
filetype plugin on
" IMPORTANT- grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL- Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"let g:tex_flavor='latex'
"""""""""""""""""""""Vim-LATEX-END"""""""""""""""""""

"This makes the commands I type in during normal mode visible below in the status line
set showcmd
"Always display the status line
set laststatus=2
"This displays the cursor location in the status line
set ruler
"This higlights the current line
set cursorline
"This shows line numbers on the left
set number
"This makes it so that the line number is displayed only for the current line and the other lines are measured with respect to the current line
set relativenumber

"This ensures that j and k move by visual lines instead of actual code lines - so that when you have long wrapped lines, j and k don't skip past the wrap
nnoremap j gj
nnoremap k gk

"TODO: Find out what this does
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

colorscheme koehler

"This sets the leader key to comma - a key you have to use to modify a key pressed instantly after
let mapleader=","

"This makes it so that Vim starts searching as characters are entered
set incsearch
"This highlights text that matches with our search string
set hlsearch
"This makes it so that ,<space> removes the highlight after searching
nnoremap <leader><space> :let @/ = ""<CR>

"This makes it so that searches ignore case
set ic

"This allows folding of code within matching brackets
set foldenable
"This means that most folds are open by defauls (anything will fold depth <10) (the scale goes up to 99)
set foldlevelstart=10
"This means that the maximum depth of nested folding can go to 10 - to prevent a lot of manual unfolding/folding
set foldnestmax=10
"This means that that the folding strategy is based on indents
set foldmethod=indent
"This remaps the spacebar to fold/unfold a block
nnoremap <space> za

"This enables syntax highlighting
syntax enable

"The default indentation is c style
set cindent
"This enables filetype-specific indentation
filetype indent on

"This is used to highlight matching brackets
set showmatch

"This is to tell vim to redraw the screen only when required
set lazyredraw

"This is to give the mouse expected behaviour
set mouse=a

"This is used to write to file as a shortcut
nnoremap <leader>w :update<CR>
"This is used to write all files open
nnoremap <leader>wa :wa<CR>

"This is used to map ctrl-dir to change panes 
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

"This is used for cooler auto-completion of commands
set wildmenu

"To make it easier to edit the vimrc during other editing.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
"To source the changes made to the vimrc into the present sessino
nnoremap <leader>sv :source $MYVIMRC<CR>

"To make it easier to open the shell
nnoremap <leader>sh :sh<CR>

