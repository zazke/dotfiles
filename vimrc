" mitsuo's vimrc
" Created c. 2019-11-11
" Last update (after destroying it accidentally) 2020-09-02
"
"                               ┌─┬─┬─┬─┬─┬─┐           
"                               │m│i│t│s│u│o│✓x         が
"                               ├─┼─┼─┼─┼─┼─┤           ん
"                               │v│i│m│r│c│←│█▓▒░       ば
"                               └─┴─┴─┴─┴─┴─┘           れ

" XDG compliant
" TODO: sort sections


" Variables
" ----------------------------------------------------------------------
set undodir=$XDG_DATA_HOME/vim/undo
set directory=$XDG_DATA_HOME/vim/swap
set backupdir=$XDG_DATA_HOME/vim/backup
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
" TODO fix this
"let vcpath="~/.vim/vimfun/"          " vim configuration path


" Useful
" ----------------------------------------------------------------------
set nocompatible
" Auto-recognize files and apply pluggins 
" filetype plugin indent on 
syntax on

" Search files
set wildmenu
set path+=**        " Search down into subfolders

set showcmd         " show partial command on last line (below status bar)
set scrolloff=5     " show a few lines of context

" not default in some systems
set backspace=indent,eol,start  " Allow <BS> and <Del> in insert mode

" number gutter
set nonumber
set norelativenumber

" Tag Jumping
" Instructions: create tag index (e.g. $ ctags -R .)
"               place cursor on tag
"               ^]  to jump to definition
"               g^] if more than 1 definition
"               ^T  to return (or ^O)
" TODO: create tags automatically (:!ctags -R . after :w if ft=c)



" Search
" ----------------------------------------------------------------------
set hlsearch
set incsearch
" Redraw and turn off search highlight in normal mode (non recursive)
nnoremap <C-L> :nohl<CR><C-L>
set ignorecase
set smartcase


" Indentation
" ----------------------------------------------------------------------
" 4 column softtabs (uses ' ', not '\t').
"   TODO: move this 'guide' to somewhere apropiate
"   tab->softtab    (:set tabstop=n)    (:set expandtab)  :retab
"   softtab->tab    :set noexpandtab    :set tabstop={softtabstop}  :retab!
"   Caution: This will insert a tab wherever it can, even between words
"   separated by as few as 2 spaces!  
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" autoindent -> smartindent -> cindent -> indentexpr (from less to more
" general, each one overrides the previous ones)
set smartindent " This is a really nice and simple one
"set cindent            
"set cinoptions=:0,g0   " See C-indenting


" Automatic formatting
" ----------------------------------------------------------------------
" see fo-table
set formatoptions=rql
set formatoptions-=o            " Automatically insert the current comment leader 
                                " after hitting 'o'.
set formatoptions+=t            " auto-wrap text (when inserting)
set formatoptions+=c            " auto-wrap comments (when inserting)
set formatoptions+=p            " Don't break honorifics like Prof. Smith
set formatoptions+=n            " Allow lists
set formatoptions+=j            " Removes comment leader when joining lines


" Word wrap
" ----------------------------------------------------------------------
set wrap
set linebreak
" To 'justify' comments or block of text (paragraph) use "gq{motion}" or
" "gp{motion}", where {motion} can be "[/", "]/", "ip", "i{", "a{".
set textwidth=80


" Other settings
" ----------------------------------------------------------------------
set mouse=a
" set cmdheight=1
" Always display the status line, even if only one window is displayed
set laststatus=2
set ruler
set encoding=utf-8


" Mappings
" ----------------------------------------------------------------------
map <F5> :source ~/.config/vim/vimrc<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>


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
source ~/.config/vim/fun.vim


" Snippets
" ----------------------------------------------------------------------
nnoremap ,ch :-1r ~/.config/vim/snippets/cheader.c<CR>


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
" TODO: Funcion para reindentar archivo con mi configuracion.  Esta funcion de
" vim.fandom.com no se como funciona.  (Ver perlexpr?)
":command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
"FIX: this shit :(
" digr :) 0x263a :( 0x2639

" yields result of previous WORD arithmetic expression (from the Vim wiki)
"inoremap <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
" Replaces previous WORD arithmetic expression with result
inoremap <C-A> <Esc>diWi<C-R>=<C-R>"<CR>


" iVim
" ----------------------------------------------------------------------
" TODO: map :h _argument_ to :h _argument_ <C-w>L<C-w>|  makes help window 
" almost fill the super small screen.


" Plugins
" ----------------------------------------------------------------------
" Automatic vim-plug install
if empty(glob('$XDG_CONFIG_HOME/vim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ARM9/arm-syntax-vim'
autocmd BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

call plug#end()

" Other plugins
source ~/.config/vim/plugins/*


" Ducktape
" ----------------------------------------------------------------------
" Not even the ducktape worked for this one on C files TODO
set formatoptions-=o            " Automatically insert the current comment leader 
" TODO: fix this shit getting reset in a markdown text
set formatoptions+=r            " auto insert comment leader after <Enter>
