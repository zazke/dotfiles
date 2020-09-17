" mitsuo's vimrc
" Created c. 2019-11-11
" Last update (after destroying it accidentally): 2020-09-02
"
"                               ┌─┬─┬─┬─┬─┬─┐           
"                               │m│i│t│s│u│o│✓x       け が
"                               ├─┼─┼─┼─┼─┼─┤            ん
"                               │v│i│m│r│c│←│█▓▒░     り ば
"                               └─┴─┴─┴─┴─┴─┘         こ れ

" XDG compliant REMOVED :D (what a pain)
" TODO: - sort sections


" Variables
" ----------------------------------------------------------------------
set undodir=~/.vim/undo
set viminfofile=~/.vim/viminfo
set viewdir=~/.vim/view


" Useful
" ----------------------------------------------------------------------
set nocompatible
" Auto-recognize files and apply pluggins 
filetype plugin indent on       " See :h vimrc-filetype
syntax on

" Search files
set wildmenu        " command-line <Tab> completion     <-- soo good
set wildignore+=*.o,*.obj,.git,*.rbc,*.class
set path+=./**30    " For gf and :find, add all subdirectories relative to
                    " current file (30 max) to the "search space"

set scrolloff=5     " show a few lines of context

set backspace=indent,eol,start  " Allow <BS> and <Del> in insert mode

" number gutter
set nonumber
set norelativenumber

" Store session information
set viminfo+='1000

" Tag Jumping   <-- so cool
" Instructions: create tag index (e.g. $ ctags -R .)
"               place cursor on tag
"               ^]  to jump to definition
"               g^] if more than 1 definition
"               ^T  to return (or ^O)
" TODO: create tags automatically (:!ctags -R . after :w if ft=c)


" Status line
" ----------------------------------------------------------------------
set showcmd         " show partial command on last line (below status bar)
" just add buffer number to the default
set statusline=%<%f\ %h%m%r%=b%02n\ \ %-14.(%l,%c%V%)\ %P


" Search
" ----------------------------------------------------------------------
set hlsearch    " highlight search (this can be annoying if no shortcut to then
                " clear the highlight
set incsearch   " Incrementally move cursor while typing search-string
" stop highlight only for current search.  
" (Still preserve <C-L> updating directory in netrw)
nnoremap <C-L> :nohl<CR><C-L>
" Ignore case only when pattern is lowercase (both needed)
set ignorecase
set smartcase


" Indentation
" ----------------------------------------------------------------------
" 4 column softtabs (uses ' ', not '\t').
"   TODO: move this 'guide' to somewhere apropiate
"   tab->softtab    :set tabstop=n      :set expandtab  :retab
"   softtab->tab    :set noexpandtab    :set tabstop={softtabstop}  :retab!
"   Caution: 
"       - This will insert a tab wherever it can, even between words
"         separated by as few as 2 spaces if ts=2!  
"       - Not recommended at all.  Use some other program to only translate
"         leading indenting from space to tabs.  Also using tabs is not very
"         good.  My opinion is that they are good as a special character to
"         separate data (like comma for CSV).
set tabstop=8           " '\t' or HT = 8 virtual columns
set shiftwidth=4        " Indentation with >> and C-T and C-D (insert mode)
set softtabstop=4       " For "inserted tabs" (inserts <Space> and <Tab>
                        " minimizing <Space>)
set expandtab           " Expand with <Space> the inserted <Tab>s
"set smarttab           " Use shiftwidth for inserted <Tabs> in the front of
                        " a line (Maybe useful for YAML)
" autoindent -> smartindent -> cindent -> indentexpr 
" (from simple/less general to complex/more general)
set smartindent         " This is a really nice and simple one
"set cindent            
"set cinoptions=:0,g0   " See C-indenting


" Automatic formatting
" ----------------------------------------------------------------------
" see fo-table
set formatoptions=l         " Don't break long lines that are already typed
set formatoptions+=q        " Allow formatting of comments with "gq"
set formatoptions+=r        " Insert current leader after <Enter> in Insert mode
set formatoptions-=o        " Automatically insert the current comment leader 
                            " after hitting 'o'.
set formatoptions+=t        " auto-wrap text (when inserting)
set formatoptions+=c        " auto-wrap comments (when inserting)
set formatoptions+=p        " Don't break honorifics like Prof. Smith
set formatoptions+=n        " Allow lists
set formatoptions+=j        " Removes comment leader when joining lines


" Word wrap
" ----------------------------------------------------------------------
set wrap            " Visual wrapping of lines wider than window
set linebreak       " Works with previous option to not break words
" To 'justify' comments or block of text (paragraph) use "gq{motion}" or
" "gp{motion}", where {motion} can be "[/", "]/", "ip", "i{", "a{".
set textwidth=80    " auto break inserted text longer than 80 colums


" Other settings
" ----------------------------------------------------------------------
set mouse=a             " Enable for all modes
" set cmdheight=1
" Always display the status line, even if only one window is displayed
set laststatus=2
set ruler
set encoding=utf-8
set more                " Enable more-prompt for listings that don't fit in
                        " screen
"hint: g< command can be used to see the last page of previous command.


" Mappings
" ----------------------------------------------------------------------
"  F1 is help, F11 is full screen (terminal emulator)
map <F5> :source ~/.vim/vimrc<CR>
map <S-F5> :e ~/.vim/vimrc<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <F9> :w<CR>:!./make.sh<CR>
" One has to do :E first in order for this to work
map <F12> :Rex<CR>
" <Leader> = '\' when 'mapleader' is empty
" Change to the directory of the current file and generate tags recursively
" there.
" TODO: make the change of directory whenever a .c .cpp .h file is opened
map <Leader>rt :cd %:h<CR>:!ctags -R .<CR>
map <C-\> :tnext<CR>
" Motion to go to beggining of function while cursor is inside
nmap [f [m[{k0

" Funcionallity of the following depends on terminal (8bit input enabled needed
" for <Meta> = Alt key combos
" From: https://vim.fandom.com/wiki/Get_Alt_key_to_work_in_terminal

nmap <M-H> <C-W>h
nmap <M-J> <C-W>j
nmap <M-K> <C-W>k
nmap <M-L> <C-W>l


" Yanking and pasting
" ----------------------------------------------------------------------
" TODO: map something to "+y (cut buffer) and "*y (selection buffer) while in
" visual mode.
"vmap <++> "+y      " The yank to the cut buffer (clipboard)
"vmap <++> "*y      " The yank to the selection buffer


" Buffers
" ----------------------------------------------------------------------
set hidden
map <S-F7> :bNext<LF>
map <S-F8> :bnext<LF>


" Printing
" ----------------------------------------------------------------------
set printoptions=paper:A4,duplex:long
" set printoptions+=number:y
" TODO: Figure out how to print multibyte encodings.  Enabling this settings
" produces errors.
set encoding=utf-8
set fileencoding=utf-8
" set printmbcharset=JIS_X_1990 " This allows Japanese characters to be printed
" set printmbfont=r:Noto-Sans-CJK-JP


" Functions
" ----------------------------------------------------------------------
" TODO: maybe replace with $runtimepath
source ~/.vim/fun.vim


" Views and Sessions (Window layout and Line folding)
" ----------------------------------------------------------------------
" It is possible to create folds automatically but idk how to do it.
" :mkview so save them :loadview to load them (zo open one, zc close one,
" zR to open all, zM to close all, zx to restore))

" Views saves folds.  Sessions saves all windows configuration and layout
" Load Sessions with $ vim -S Session.vim

" To automatically save and restore views for *.c *.cpp files: 
au BufWinLeave *.c mkview
au BufWinEnter *.c silent loadview
au BufWinLeave *.cpp mkview
au BufWinEnter *.cpp silent loadview


" Snippets
" ----------------------------------------------------------------------
" I deleted the file accidently
"nnoremap ,ch :-1r ~/.vim/snippets/cheader.c<CR>


" File Browsing
" ----------------------------------------------------------------------
" Use netrw out of the box file browser plugin.
"   :e .            open file browser on current directory
"   V or t          open file on vsplit or new tab. 
"   :bd or :Rex     to return
"   More mappings on |netrw-browse-maps|
"let g:netrw_banner=0        " disable banner
"let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'  " wtf? (?)
" Learned from Max Cantor talk https://youtu.be/XA2WjJbmmoM


" Additions
" ----------------------------------------------------------------------
" Replaces previous WORD arithmetic expression with result (from Vim
" fandom-wiki)
inoremap <C-A> <Esc>diWi<C-R>=<C-R>"<CR>


" Plugins
" ----------------------------------------------------------------------
" I disabled it bc I think it interferes with formatoptions
"" Automatic vim-plug install
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"
"call plug#begin()
"Plug 'ARM9/arm-syntax-vim'
"autocmd BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
"
"call plug#end()

" Other plugins
source ~/.vim/plugins/IndexedSearch.vim


" Colors
" ----------------------------------------------------------------------
" ADDME :)


" Ducktape (place this in ~/.vim/after (after directory))
" ----------------------------------------------------------------------
" Not even the ducktape worked for this one on C files TODO
set formatoptions-=o            " Automatically insert the current comment leader 
" TODO: fix this shit getting reset in a markdown text
set formatoptions+=r            " auto insert comment leader after <Enter>
