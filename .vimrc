"My .vimrc file
"Anindya Sharma <anindya.sharma1@gmail.com>

"Flip CapsLock and Escape using
"/usr/bin/setxkbmap -option caps:swapescape

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAIN SETTINGS BEFORE PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use vImproved instead of traditional vi
set nocompatible
"Set leader key before extensions are loaded
let mapleader=","
"Local leader is for filetype specific commands, use `\`
let maplocalleader="\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Terminal colours for ctermfg and ctermbg
set t_Co=256
"Some cool colourschemes - elflord, koehler, ron, slate, default
colorscheme elflord
"Dark color
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE PLUGIN MANAGEMENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off "Because Vundle should have control of it

"To include Vundle into the run time path and intialise
set rtp+=~/.vim/bundle/Vundle.vim

"TODO: Lazy loading of plugins to make vim lighter?
"List of plugin commands - must be in between vundle#begin and end.
call vundle#begin()
"{
    " 1) USED A LOT
    "Let Vundle manage itself, required.
    Plugin 'VundleVim/Vundle.vim'
    "For autocompletion supertab
    Plugin 'ervandew/supertab'
    "For a smoother statusline
    Plugin 'bling/vim-airline'
    "For distraction-free writing
    Plugin 'junegunn/goyo.vim'
    "For toggling and displaying marks
    Plugin 'kshenoy/vim-signature'
    "For repeating plugin commands
    Plugin 'tpope/vim-repeat'

    " 2) FILETYPE SPECIFIC
    "For DoxyGen syntax highlighting on top of C/C++
    Plugin 'DoxyGen-Syntax'
    "For vim-go, a plugin for Go syntax
    Plugin 'fatih/vim-go'

    " 3) DON'T REALLY USE?
    "For new verbs
    Plugin 'tpope/vim-surround'

    "4) POTENTIALS/LOOK COOL
    "Valloric/YouCompleteMe
    "NERDcommenting or commentary.vim
    "NERDTree
    "vim-gitgutter
    "easymotion
    "fugitive
    "vim-markdown (needs tabular)
"}
call vundle#end()

filetype plugin on "required for the plugins to have effect

"Brief help for vundle-
" :PluginList - lists configured plugins
" :PluginInstall - install plugins; append '!' to update
" :PluginUpdate - another way of updating
" :PluginSearch foo - searches for foo
" :PluginClean - confirms removal of unused plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SPECIFIC SECTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"TODO: For all the plugin settings below, activate the commands only if we know
"the plugins are loaded. That way this .vimrc is portable even to systems where
"the plugins are not loaded

" ****** YouCompleteMe ******
"let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_autoclose_preview_window_after_insertion=1
"
"let g:ycm_filetype_blacklist = {
"    \ 'markdown' : 1,
"    \ 'text' : 1,
"    \ 'pandoc' : 1
"    \}

" ****** GoYo ******
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

" ****** Doxygen ******
"Need to set syntax to cpp.doxygen
nnoremap <leader>dox :set syntax=cpp.doxygen<CR>
nnoremap <leader>cpp :set syntax=cpp<CR>
"CPP/doxygen automatically set syntax
autocmd BufEnter *.cpp,*.cc,*.hpp,*.hh,*.c,*.h
    \ set syntax=cpp.doxygen

" ****** Vim-airline ******

"Make all information explicit
let g:airline_skip_empty_sections = 0
"V- is v line, V| is v block
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V-',
  \ '' : 'V|',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

"Remove VCS information
let g:airline_section_b = ''
"Remove filetype
let g:airline_section_x = ''
"Remove fileencoding and fileformat if it is utf-8[unix]
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"Make the position in vim file more succinct
let g:airline_section_z = '%p%% %l/%L:%v'
"Remove warning and error counts (check this again)
let g:airline_section_error = ''
let g:airline_section_warning = ''

"Enable the displaying of buffer list on top
let g:airline#extensions#tabline#enabled = 1
"TODO: look at all the config for tabline settings
"NOTE: Go to /autoload/airline/extensions/tabline/buffers.vim
"and change the label from 'buffers' to whatever else
"so that the top buffer line isn't taken away by 'buffers'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFIC STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"This enables syntax highlighting depending on filetype
syntax enable
"Treat sage files like Python files
autocmd BufEnter *.sage,*.spyx set filetype=python
autocmd BufEnter *.Rprofile set filetype=r

"To autoformat paragraphs in text mode
autocmd BufEnter *.md,*.txt
    \ set formatoptions+=a

"Filetype specific indentation
autocmd BufRead,BufNewFile *.R,*.Rd,*.Rprofile
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile Makefile
    \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"This is used to disable colorcolumn for certain files
function! RemoveColorColumn()
    let &colorcolumn=''
    let g:colorcolumn_is_on = 0
endfunction
command! RemoveColorColumn call RemoveColorColumn()
"Call it for all relevant files
autocmd BufEnter *.tex,*.txt,*.md,*.sh
    \ :call RemoveColorColumn()

"This is used to remove trailing white spaces
function! TrimWhiteSpace()
    let l:save_cursor = getpos('.')
    "\s is whitespace, $ is end of line
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfunction
command! TrimWhiteSpace call TrimWhiteSpace()
"Call it for all relevant files
autocmd BufWrite *.cc,*.hh,*.cpp,*.hpp,*.c,*.h,*.sh,*.py,*.vimrc,*.R,*.tex,*.sage,*.spyx,*.m,*.bib
    \ :call TrimWhiteSpace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL VIM BEHAVIOUR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2        "Always display the status line
set showcmd             "Show commands being typed
set showmode            "Show insert/normal/visual etc

set encoding=utf-8      "Encoding to display a file in vim
set fileencoding=utf-8  "Encoding to read/write files

set belloff=all         "Disable all alarms/visual bells

"To make the escape more easy to identify
"However, this makes the cursor and arrow keys disabled in insert mode
set noesckeys
"Use the system keyboard and store in register '+'
set clipboard=unnamedplus
"TODO:
"1) Mouse still works on terminal for some reason <- FIX
"2) In insert mode, scrolling on the touchpad inserts characters <- FIX
set mouse=

"Where to store the undo stuff, in order of preference
"TODO: make vim create this folder if it does not exist
set undodir="~/.vim/undo/"
"To make vim create an .un~ file to store the list of all things done to a
"file, so that undos transcend opening and closing of files
set undofile
"Use git for important version control; we have an undofile anyway
set noswapfile
set nobackup
set nowritebackup

"If in vimdiff, automatically update differences on saving
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM COMMAND LINE STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=1000        "Store lots of commands
"Scroll through command history better
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
set wildmenu            "Complete commands with <TAB>
set wildignorecase      "Ignorecase whilst autocompleting
"Don't have smartcase for the commandline autocompletetion
"Assumes both ignorecase and smartcase are already set
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END
"Complete 1) longest common substring 2) list all matches 3) full first match
set wildmode=longest,list,full
"Ignore some standard files and directories whilst editing
set wildignore+=*.pdf,*.o,*.so,*.pyc,.git/*,*.git

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WRAPPING AND LINES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ttyfast             "Make scrolling fast
set scrolloff=3         "Give 3 lines of context around current line
set wrap                "Wrap lines around the window
set sidescroll=1        "Scroll by only 1 column as opposed to half a screen
set sidescrolloff=3     "Give 3 columns of context around cursor

"Make scrolling visually intuitive
"TODO: set a 'Wrap' that toggles between wrap and sidescroll and j/gj etc
if &wrap == 1
    nnoremap j gj
    nnoremap k gk
    nnoremap $ g$
    nnoremap 0 g0
    vnoremap j gj
    vnoremap k gk
    vnoremap $ g$
    vnoremap 0 g0
endif
"Allows us to backspace over a lot of things
"There is an option to make h and l wrap over lines using whichrap,
"but this is not recommended as it may change the behaviour of other
"combinations when h and l are used as motions
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION AND BRACKETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on  "Indent code for me
set autoindent      "Number of spaces a <TAB> is in the file
set tabstop=4       "Number of spaces that are inserted when <TAB> is hit
set softtabstop=4   "Number of spaces for autoindent
set shiftwidth=4    "Expand tabs to spaces
set expandtab       "Make sure Vim only uses the options above
set nosmarttab

set showmatch           "Highlight matching brackets
set foldenable          "Allow folding code within matching brackets
set foldlevelstart=5    "Anything with fold depth <5 is open
set foldnestmax=3       "Maximum depth of nested folding is 3
set foldmethod=indent   "Folding strategy is based on indents
nnoremap <space> za     "To fold/unfold a block

"This makes vim list invisible characters like tab, space, etc
set listchars=tab:▸\ ,eol:¬,trail:␣,precedes:←,extends:→,nbsp:␣
"This makes it easy to toggle between showing these characters and not
nnoremap <leader>k :set list!<CR>
"The colours for these invisible characters
highlight NonText    ctermfg=135
highlight SpecialKey ctermfg=135
highlight Comment cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPECIAL COLUMNS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler               "Show cursor location
set cursorline          "Highlight current line
set number              "Show line numbers in the left column
set relativenumber      "Number are with respect to current line

"For gutter column, make the background same as line number background
highlight clear SignatureMarkText
highlight SignatureMarkText ctermfg=red
highlight clear SignColumn "Needs to be after syntax enable
"TODO: make the usage of marks even better by customising ' and `

"To make it so that once you type past 80 characters, the text
"automatically wraps for you
set textwidth=80

"Displays a coloured column towards the end of the screen to indicate a long
"line is being written, and ensures all columns after some point are coloured
"too, and the corresponding text is highlighted
let g:colorcolumn_is_on = 0
"This is used to toggle between colorcolumn options
function! ToggleColorColumn()
    if g:colorcolumn_is_on
        let &colorcolumn=''
        let g:colorcolumn_is_on = 0
    else
        let &colorcolumn=join(range(81, 999),",")
        highlight ColorColumn ctermbg=235 ctermfg=255
        let g:colorcolumn_is_on = 1
    endif
endfunction
command! ToggleColorColumn call ToggleColorColumn()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch   "Star searching as I type
set hlsearch    "Highlight all matches for the search
set ignorecase  "Ignore case during searches
set smartcase   "Unless I explicity type a capital character
set gdefault    "Do all substitutions on a line, not just the first
"TODO: look at / \v \m \M and \V for searches

"For clearing my search expression
nnoremap <leader><space> :let @/ = ""<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SAVING, OPENING, CLOSING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"To save a file and open a new one
nnoremap S :update<CR>:e<space>
"To save a file only if changed have been made
nnoremap s :update<CR>
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>a
"To sudo save a file when permission is needed, use :W
command! W w !sudo tee % > /dev/null
"To write all open files
nnoremap <leader>wa :wa<CR>

"To close a window
nnoremap Q :q<CR>
"To kill the current buffer and start a new one
nnoremap K :enew<CR>
"To save and then close a window
nnoremap X :update<CR>:q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS, WINDOWS, TABS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Make the windows split to the right and bottom by default
set splitbelow
set splitright
"Make the creation of splits easier
nnoremap \| :vsplit<space>
nnoremap _ :split<space>
"This is used to map ctrl-dir to change windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"To move between buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
"To delete the current buffer
:nnoremap <C-X> :bdelete<CR>

"To open file under cursor in a vsplit
"TODO: play around so that we can make this open it in the 'other' window
"if there is already a vsplit
nnoremap gF <C-w>vgf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HANDY HELPER STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"To make it easier to edit the vimrc during other editing.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
"To source the changes made to the vimrc into the present session
nnoremap <leader>sv :source $MYVIMRC<CR>

"To create a scratch file
nnoremap <leader>sc :new<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR>:setlocal noswapfile<CR>

"To make it easier to open the shell
nnoremap <leader>sh :sh<CR>
"Get our custom aliases
let $BASH_ENV = "~/.bash_aliases"

"Cool stuff for calculation when you have selected an expression
vnoremap <C-e> :!bc<CR>

"Set Spell checker and a shortcute to toggle it
set spelllang=en_gb
nnoremap <leader>s :set spell!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POTENTIAL FEATURES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO:
"-> Customize the status line using set statusline
"-> Customize the titlestring
"-> Get Snipmate for snippet control
"-> Get Ack and learn it (better than grep), but also check out vimgrep and
"see how quickfix makes search results display nicer in the statusline, and
"then checkout IndexSearch
"-> Play around with Autocmd events to make default code for .cpp, .hh files,
"*and so much more*
"-> Think about autocompletetion of matching brackets/parantheses/quotes etc
"-> Remap ; to : and make # do the same function as ; Because # is the opposite
"of * and who uses that? Or perhaps we should use it and find something else
