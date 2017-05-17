"This is my .vimrc file where I store the settings for my vim editor

"This sets the leader key to comma
let mapleader=","
"
"A list of colors for ctermbg, ctermfg (foreground and background colors) can
"be found at http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
"Some cool colourschemes
"colorscheme elflord
colorscheme koehler
"colorscheme ron
"colorscheme slate

""""Pathogen stuff"""""
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""
"Vundle stuff for vim plugin management
set nocompatible "We need vImproved, just vi won't do

filetype off "Because Vundle should have control of it

"To include Vundle into the run time path and intialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"List of plugin commands - must be in between vundle#begin and end.

Plugin 'VundleVim/Vundle.vim' "Let Vundle manage itself, required.
Plugin 'Valloric/YouCompleteMe' "For YouCompleteMe, an autocomplete plugin, esp for C
Plugin 'fatih/vim-go' "For vim-go, a plugin for Go syntax
Plugin 'junegunn/goyo.vim' "For distraction-free writing

"All plugins must be declared before this
call vundle#end()
filetype plugin indent on "required for the plugins to have effect

"Brief help for vundle-
" :PluginList - lists configured plugins
" :PluginInstall - install plugins; append '!' to update
" :PluginUpdate - another way of updating
" :PluginSearch foo - searches for foo
" :PluginClean - confirms removal of unused plugins

"See :h in vundle for more details
""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_autoclose_preview_window_after_insertion=1

"""""Goyo stuff"""""""
function! GoyoEnterFn()
	set noshowmode
	set noshowcmd
	set scrolloff=999
	" ...
endfunction

function! GoyoLeaveFn()
	resize-pane -Z
	set showmode
	set showcmd
	set scrolloff=5
	" ...
endfunction

autocmd! User GoyoEnter nested call GoyoEnterFn()
autocmd! User GoyoLeave nested call GoyoLeaveFn()
"""""""""""""""""""

""""""NERDTree stuff"""
"To open and close NERDTree
nmap <C-n> :NERDTreeToggle<CR>
"To open NERDTree automatically when no files are specified or if vim starts
"up opening a directory
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
	\ | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"To close NERDTree when it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
	\&& b:NERDTree.isTabTree()) | q | endif
"For other NERDTree options like file highlighting and stuff,
"look at the Github page

"This sets the leader key to comma - check why this is present twice in the
".vimrc - something to do with plugins? Try removing this and see?
let mapleader=","

"This enables syntax highlighting depending on filetype
syntax enable
"Treat sage files like Python files
autocmd BufRead,BufNewFile *.sage,*.spyx set filetype=python
"This is to give the mouse expected behaviour
set mouse=a
"TODO: find a way of disabling mouse on Ubuntu's terminal as it's
"annoying on a laptop. Just 'set mouse=' does not work.

"This is to tell vim to redraw the screen only when required
set lazyredraw
"The encoding used to display a file in vim (Unicode)
"The encoding used to write and read files is changed by using fileencoding
set encoding=utf-8

"This makes the commands I type in during normal mode visible below in the
"status line
set showcmd
"Always display the status line
set laststatus=2
"Show which mode I am in
set showmode
"To make the escape more easy to identify
"However, this makes the cursor and arrow keys disabled in insert mode
set noesckeys

"This displays the cursor location in the status line
set ruler
"This highlights the current line
set cursorline
"This shows line numbers on the left
set number
"This makes it so that the line number is displayed only for the current line and the
"other lines are measured with respect to the current line
set relativenumber
"This makes sure that there are always 3 lines around the highlighted line to
"give context
set scrolloff=3
"Makes scrolling faster
set ttyfast

"Wraps lines around the window
set wrap
"This ensures that j and k move by visual lines instead of actual code lines -
"so that when you have long wrapped lines, j and k don't skip past the wrap
nnoremap j gj
nnoremap k gk
"Allows us to backspace over a lot of things
"There is an option to make h and l wrap over lines using whichrap,
"but this is not recommended as it may change the behaviour of other
"combinations when h and l are used as motions
set backspace=indent,eol,start
"Displays a coloured column towards the end of the screen to indicate a long
"line is being written, and ensures all columns after some point are coloured
"too, and the corresponding text is highlighted
let &colorcolumn=join(range(76, 999),",")
highlight ColorColumn ctermbg=235 ctermfg=254

"This is used to disable colorcolumn for certain files
function! RemoveColorColumn()
	let &colorcolumn=''
endfunction
command! RemoveColorColumn call RemoveColorColumn()
"Call it for all relevant files
autocmd BufEnter *.tex,*.txt,*.md
	\ :call RemoveColorColumn()

filetype indent on
"
"Make vim indent code for me
set autoindent
"This enables filetype-specific indentation
"Number of spaces a <TAB> is in the file
set tabstop=4
"Number of spaces that are inserted when <TAB> is hit
set softtabstop=4
"Number of spaces for autoindent
set shiftwidth=4
"Don't expand tabs to spaces
set expandtab

"This makes vim list invisible characters like tab, space, etc
set list
set listchars=tab:▸\ ,eol:¬
"This makes it easy to toggle between showing these characters and not
nmap <leader>l :set list!<CR>
"The colours for these invisible characters
highlight NonText    ctermfg=235
highlight SpecialKey ctermfg=235

"This makes it so that Vim starts searching as characters are entered
set incsearch
"This highlights text that matches with our search string
set hlsearch
"This makes it so that ,<space> removes the highlight after searching
nnoremap <leader><space> :let @/ = ""<CR>
"This makes it so that searches ignore case unless you type capitals
set ignorecase
set smartcase
"This ensures by default, all substitutions are done on a line rather than just
"one by ensuring the g at the end of a s/// command is in there. This can be
"toggled by adding another g
set gdefault

"This is used to highlight matching brackets
set showmatch
"This is used to move around bracket pairs with <tab> rather than %
vnoremap <tab> %
nnoremap <tab> %

"This allows folding of code within matching brackets
set foldenable
"This means that most folds are open by defaults (anything will fold depth <10)
"(the scale goes up to 99)
set foldlevelstart=10
"This means that the maximum depth of nested folding can go to 10 -
"to prevent a lot of manual unfolding/folding
set foldnestmax=10
"This means that that the folding strategy is based on indents
set foldmethod=indent
"This remaps the spacebar to fold/unfold a block
nnoremap <space> za

"This is used to write to file as a shortcut
nnoremap <leader>w :update<CR>
"This is used to write all files open
nnoremap <leader>wa :wa<CR>

"This is used to remove trailing white spaces
function! TrimWhiteSpace()
    let l:save_cursor = getpos('.')
	"\s is whitespace, $ is end of line
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfunction
command! TrimWhiteSpace call TrimWhiteSpace()
"Call it for all relevant files
autocmd BufWrite *.cc,*.hh,*.cpp,*.hpp,*.c,*.h,*.sh,*.py,*.vimrc,*.R,*.tex,*.md,*.sage,*.spyx
	\ :call TrimWhiteSpace()

"This is used to make vertical splits easy
nmap <leader>v :vsplit<space>
"This is used to map ctrl-dir to change windows
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
"Make the windows split to the right and bottom by default
set splitbelow
set splitright

"This is used to invoke command completion on pressing <TAB>
set wildmenu
"First complete till longest common string, then list all matches, then
"complete the next full match
set wildmode=longest,list,full
"TODO: Set a list of files to be ignored in completion by using wildignore

"This makes autocompletion of commands better as we have more data to pick
"from
set history=1000
""This makes it so that you don't have to use the arrow keys while searching
"through command line history
cmap <C-k> <Up>
cmap <C-j> <Down>

"To make it easier to edit the vimrc during other editing.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
"To source the changes made to the vimrc into the present session
nnoremap <leader>sv :source $MYVIMRC<CR>

"To make it easier to open the shell
nnoremap <leader>sh :sh<CR>
"To make vim create an .un~ file to store the list of all things done to a
"file, so that undos transcend opening and closing of files
set undofile
"Use git for important version control, and we have an undofile anyway
set noswapfile

"Set Spell checker
set spelllang=en_gb
"Toggle spell checking with <leader>s
nnoremap <leader>s :set spell!<CR>

"Things that have to happen after sourcing the vimrc
"rainbow has to be reloaded
"TODO: find out how to do this

"TODO:
"-> Customize the status line using set statusline
"-> Customize the titlestring
"-> Make shortcuts so that working with windows/tabs/buffers is easier
"-> Get Snipmate for snippet control
"-> Get NERDCommentor for comment management
"-> Get Ack and learn it (better than grep), but also check out vimgrep and
"see how quickfix makes search results display nicer in the statusline, and
"then checkout IndexSearch
"-> Get YankRing or a better clipboard manager, or make the default yank/delete
"place the system clipboard
"-> Get surround.vim to enable the 'surrounding' adjective into our vim lingo,
"and then add repeat.vim to enable repeating it
"-> Play around with Autocmd events to make default code for .cpp, .hh files,
"*and so much more*
"-> Get gundo to work by compiling Vim from source with Python 2.4+ support
"-> Think about autocompletetion of matching brackets/parantheses/quotes etc
