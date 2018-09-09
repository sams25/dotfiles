"My .vimrc file
"Anindya Sharma <anindya.sharma1@gmail.com>

"Flip CapsLock and Escape using
"/usr/bin/setxkbmap -option caps:swapescape

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAIN SETTINGS BEFORE PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
"Use vImproved instead of traditional vi
set nocompatible
"Set leader key before extensions are loaded
let mapleader=","
"Local leader is for filetype specific commands, use `\`
let maplocalleader="\\"
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
"Terminal colours for ctermfg and ctermbg
set t_Co=256
"Some cool colourschemes - elflord, koehler, ron, slate, default
colorscheme elflord
"Dark color
set background=dark
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE PLUGIN MANAGEMENT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
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
    "For repeating plugin commands
    Plugin 'tpope/vim-repeat'
    "For consistent vim-tmux navigation
    Plugin 'christoomey/vim-tmux-navigator'
    "For new verbs
    Plugin 'tpope/vim-surround'

    " 2) FILETYPE SPECIFIC
    "For DoxyGen syntax highlighting on top of C/C++
    Plugin 'DoxyGen-Syntax'
    "For vim-go, a plugin for Go syntax
    Plugin 'fatih/vim-go'
    "For markdown syntax
    Plugin 'vim-pandoc/vim-pandoc-syntax'

    " 3) DON'T REALLY USE?
    "For toggling and displaying marks
    Plugin 'kshenoy/vim-signature'

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

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SPECIFIC SECTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

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

augroup GoyoStuff
    autocmd!
    autocmd User GoyoEnter nested call GoyoEnterFn()
    autocmd User GoyoLeave nested call GoyoLeaveFn()
augroup END

" ****** Doxygen ******
"Need to set syntax to cpp.doxygen
nnoremap <leader>dox :set syntax=cpp.doxygen<CR>
nnoremap <leader>cpp :set syntax=cpp<CR>
"CPP/doxygen automatically set syntax
augroup CppDoxygen
    autocmd!
    autocmd BufEnter *.cpp,*.cc,*.hpp,*.hh,*.c,*.h
        \ set syntax=cpp.doxygen
augroup END

" ****** Vim-signature****
"Make the 0-9 marks reflect the 'uppercase' versions of 0-9
let g:SignatureIncludeMarkers = ')!"£$%^&*('
"Only display the current marker, and suffix it with an underscore
let g:SignatureMarkOrder = 'm '

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
let g:airline#extensions#tabline#enabled = 0
"The label for the buffer line
let g:airline#extensions#tabline#buffers_label = ''
"Enable the selection of up to 10 buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1
"Some basic shortcuts, we can't use nnoremap because <plug> expands out the
"internal command
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
\}
"Separators between buffer names in the tabline
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL VIM BEHAVIOUR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

set laststatus=2          "Always display the status line
set showcmd               "Show commands being typed
set showmode              "Show insert/normal/visual etc
set encoding=utf-8        "Encoding to display a file in vim
set fileencoding=utf-8    "Encoding to read/write files
set virtualedit=block     "Allow cursor to go beyond EOL during visual block
set lazyredraw            "Do not redraw every time a macro is executed
syntax enable             "Syntax highlighting, has to be before SpeicalColumns
set belloff=all           "Disable all alarms/visual bells
set clipboard=unnamedplus "Use the system keyboard and store in register '+'

set mouse=              "Disable all mouse features in terminal
"TODO: fiddle with this, 'esckeys' and 'ttimeoutlen'
"Disable arrow keys
inoremap OA <nop>
inoremap OB <nop>
inoremap OC <nop>
inoremap OD <nop>

"Do not show startup screen
set shortmess+=I
function! Start()
    "Don't run if we have command line arguments,
    if argc()
        echo "Loaded custom .vimrc file and opened required buffer"
        return
    endif
    edit .
    echo "Loaded custom .vimrc file, and opened current directory"
endfunction
augroup VimEnterSpecific
    autocmd!
    autocmd VimEnter * call Start()
augroup END

"Use git for important version control; we have an undofile anyway
set noswapfile
set nobackup
set nowritebackup
"Where to store the undo stuff, in order of preference
"TODO: make vim create this folder if it does not exist
set undodir=$HOME/.vim/undo/
"A lot of history
set undolevels=300
"To make vim create an .un~ file to store the list of all things done to a
"file, so that undos transcend opening and closing of files
set undofile

"If in vimdiff, automatically update differences on saving
augroup VimdiffSpecific
    autocmd!
    autocmd BufWritePost * if &diff == 1 | diffupdate | endif
augroup END

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM COMMAND LINE STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

set history=1000        "Store lots of commands
"Scroll through command history better
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
set wildmenu            "Complete commands with <TAB>
set wildignorecase      "Ignorecase whilst autocompleting
"Don't have smartcase for the commandline autocompletetion
"Assumes both ignorecase and smartcase are already set
augroup DynamicSmartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END
"Complete 1) longest common substring 2) list all matches 3) full first match
set wildmode=longest,list,full
"Ignore some standard files and directories whilst editing
set wildignore+=*.pdf,*.o,*.so,*.pyc,.git/*,*.git

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

" Complete whole filenames/lines with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

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

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION AND BRACKETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
filetype indent on
set autoindent      "Indent code for me
set tabstop=4       "Number of spaces a <TAB> is in the file
set softtabstop=4   "Number of spaces that are inserted when <TAB> is hit
set shiftwidth=4    "Number of spaces for autoindent
set expandtab       "Expand tabs to spaces
set nosmarttab      "Make sure Vim only uses the options above

set showmatch           "Highlight matching brackets
set foldenable          "Allow folding code within matching brackets
set foldnestmax=3       "Maximum depth of nested folding is 3
set foldmethod=indent   "Folding strategy is based on markers
set foldlevelstart=99   "Don't close anything by default
"To fold/unfold a block
nnoremap <space> za

"This makes vim list invisible characters like tab, space, etc
set listchars=tab:▸\ ,eol:¬,trail:␣,precedes:←,extends:→,nbsp:␣
"This makes it easy to toggle between showing these characters and not
nnoremap <leader>k :set list!<CR>
"The colours for these invisible characters
highlight NonText    ctermfg=135
highlight SpecialKey ctermfg=135
highlight Comment cterm=italic

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPECIAL COLUMNS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
set ruler               "Show cursor location
set cursorline          "Highlight current line
set number              "Show line numbers in the left column
set relativenumber      "Number are with respect to current line

"For gutter column, make the background same as line number background
highlight clear SignatureMarkText
highlight SignatureMarkText ctermfg=028
highlight clear SignColumn "Needs to be after syntax enable
"Make ' go to marked line and position and ` go to beginning of marked line
nnoremap ' `
nnoremap ` '
"To make it so that once you type past 80 characters, the text
"automatically wraps for you
set textwidth=80

"Displays a coloured column towards the end of the screen to indicate a long
"line is being written, and ensures all columns after some point are coloured
"too, and the corresponding text is highlighted
let g:colorcolumn_is_on = 1
let &colorcolumn=join(range(81, 999),",")
highlight ColorColumn ctermbg=232 ctermfg=255
"This is used to toggle between colorcolumn options
function! ToggleColorColumn()
    if g:colorcolumn_is_on
        let &colorcolumn=''
        let g:colorcolumn_is_on = 0
    else
        let &colorcolumn=join(range(81, 999),",")
        highlight ColorColumn ctermbg=232 ctermfg=255
        let g:colorcolumn_is_on = 1
    endif
endfunction
command! ToggleColorColumn call ToggleColorColumn()

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
set incsearch   "Star searching as I type
set hlsearch    "Highlight all matches for the search
set ignorecase  "Ignore case during searches
set smartcase   "Unless I explicity type a capital character
set gdefault    "Do all substitutions on a line, not just the first
"TODO: look at / \v \m \M and \V for searches

"For clearing my search expression
nnoremap <leader><space> :let @/ = ""<CR>

"To make code-aware tags
"TODO: make this autoupdate instead of rebuilding every time
command! MakeTags !ctags -R .
"Shortcut for updating tags
nnoremap <leader>t :MakeTags<CR><CR>
"And using them in insert mode
inoremap <C-]> <C-x><C-]>
"<C-]> for finding tags, (g<C-]> for ambiguous)
"<C-t> for jumping back to previous location

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SAVING, OPENING, CLOSING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

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
"To save and then close a window
nnoremap X :update<CR>:q<CR>

"To make fuzzy recursive search a thing
set path+=**
"To use the find feature while editing
nnoremap <leader>f :find<space>

"For browsing using the default netrw
let g:netrw_banner=0            "Disable top banner
let g:netrw_preview=1           "Use vertical split for prev windo by default
let g:netrw_browse_split=4      "Open in previous window
let g:netrw_liststyle=3         "Tree-like browsing

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS, WINDOWS, TABS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

"Make the windows split to the right and bottom by default
set splitbelow
set splitright
"Make the creation of splits easier
nnoremap \| :vsplit<space>
nnoremap _ :split<space>
"This is used to map ctrl-dir to change windows
"Uncomment this only if we do not want consistent tmux/vim navigation
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l

"To kill the current buffer and start a new one
"Opens previous buffer, and deletes the 'latest buffer'
nnoremap K :bprevious\|bdelete #<CR>
"To open a buffer using a fuzzy search-string
nnoremap <leader>b :b<space>

"To open file under cursor in a vsplit
"TODO: play around so that we can make this open it in the 'other' window
"if there is already a vsplit
nnoremap gF <C-w>vgf

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HANDY HELPER STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

"To make it easier to edit the vimrc during other editing.
nnoremap <leader>ev :edit $MYVIMRC<CR>
"To source the changes made to the vimrc into the present session
nnoremap <leader>sv :source $MYVIMRC<CR>

"To create a scratch file
nnoremap <leader>sc :new<CR>:setlocal buftype=nofile<CR>
                    \ :setlocal bufhidden=hide<CR>:setlocal noswapfile<CR>

"For going through quickfix errors after using make
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>
"- open quickfix window
nnoremap <leader>o :copen<CR>
"- close quickfix window
nnoremap <leader>c :cclose<CR>

"To make it easier to open the shell
nnoremap <leader>sh :sh<CR>
"Get our custom aliases
let $BASH_ENV = "~/.bash_aliases"

"Cool stuff for calculation when you have selected an expression
vnoremap <C-e> :!bc<CR>

"Set Spell checker and a shortcute to toggle it
set spelllang=en_gb
nnoremap <leader>s :set spell!<CR>

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFIC STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

"TODO: use Filetype for everything, don't just use *.whatever
augroup VimSpecifc
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END

augroup SageSpecific
    autocmd!
    "Treat sage files like Python files
    autocmd BufEnter *.sage,*.spyx set filetype=python
augroup END

augroup RSpecific
    autocmd!
    autocmd BufEnter *.Rprofile set filetype=r
    "Shortcuts for common operators
    autocmd FileType r inoremap <buffer> - <-
    autocmd FileType r inoremap <buffer> <C-b> %>%
    "Indent R with 2 spaces, the standard for R
    autocmd BufRead,BufNewFile *.R,*.Rd,*.Rprofile
        \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

"Make commands for C/C++
augroup CppSpecific
    autocmd!
    "To make using the recipe in the given directory
    autocmd Filetype cpp,c nnoremap <buffer> <C-m> :make<CR>
    "To add a semicolon to the end of the current line
    autocmd Filetype cpp,c nnoremap <buffer> <leader>; mqA;<ESC>`q
    "To toggle between header and cpp files quickly
    autocmd Filetype cpp,c nnoremap <buffer> <leader>j :e %<.
augroup END

augroup MakefileSpecific
    autocmd!
    "Use actual tabs for makefiles instead of spaces
    autocmd BufRead,BufNewFile Makefile
        \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup END

augroup PlaintextSpecific
    autocmd!
    "To autoformat paragraphs in text mode
    autocmd BufEnter *.txt
        \ setlocal formatoptions+=a
augroup END

augroup pandoc_syntax
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md
        \ set filetype=markdown.pandoc
    "To prevent Vim from automatically joining lines
    autocmd BufEnter *.md setlocal formatoptions-=a
augroup END

"This is used to disable colorcolumn for certain files
function! RemoveColorColumn()
    let &colorcolumn=''
    let g:colorcolumn_is_on = 0
endfunction
command! RemoveColorColumn call RemoveColorColumn()
"Call it for all relevant files
augroup NoColorColumnSpecific
    autocmd!
    autocmd BufEnter *.tex,*.txt,*.md,*.sh
        \ :call RemoveColorColumn()
augroup END

"This is used to remove trailing white spaces
function! TrimWhiteSpace()
    let l:save_cursor = getpos('.')
    "\s is whitespace, $ is end of line
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfunction
command! TrimWhiteSpace call TrimWhiteSpace()
"Call it for all relevant files
augroup TrimWhiteSpaceSpecific
    autocmd!
    autocmd BufWrite *.cc,*.hh,*.cpp,*.hpp,*.c,*.h,*.sh,*.vimrc
            \ :call TrimWhiteSpace()
    autocmd BufWrite *.R,*.py,*.tex,*.bib,*.sage,*.spyx,*.m
            \ :call TrimWhiteSpace()
    autocmd BufWrite Makefile
            \ :call TrimWhiteSpace()
augroup END

"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POTENTIAL FEATURES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
"TODO:
"-> Play around with Autocmd events
"----> make default code for .cpp, .hh files
"----> use filetype specific iabbrevs for common constructs
"----> use echom to log what is happening
"
"-> Look at folding the .vrimrc by default
"-> Get Snipmate for snippet control
"-> Get Ack and learn it (better than grep), but also check out vimgrep and
"see how quickfix makes search results display nicer in the statusline, and
"then checkout IndexSearch
"-> Configure the makeprg section to be filetype specific
"-> Think about autocompletetion of matching brackets/parantheses/quotes etc
"-> Remap ; to : and make # do the same function as ; Because # is the opposite
"of * and who uses that? Or perhaps we should use it and find something else
"-> Think of a better way of using insert-mode abbreviations such that when you
"click backspace, the original text is reverted back
"-> Have a command to return a buffer to the state that is stored on disc
"-> Have a command to list all the colours available in vim
"}}}
