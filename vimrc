" mitsuo's vimrc
" Created c. 2019-11-11
"
" ┌─┬─┬─┬─┬─┬─┐
" │m│i│t│s│u│o│✓x
" ├─┼─┼─┼─┼─┼─┤
" │v│i│m│r│c│←│█▓▒░
" └─┴─┴─┴─┴─┴─┘
" がんばれ

" Shit that gets disabled because I created this file
" ===================================================
set nocompatible
" Auto-recognize files and apply pluggins 
" filetype plugin indent on 
syntax on
set wildmenu
set showcmd
set scrolloff=5	    " show a few lines of context

" Options that aren't default in some systems
" ===========================================
set backspace=indent,eol,start

" Number gutter
" =============
set nonumber
set norelativenumber

" Search
" ======
set hlsearch
set incsearch
" Redraw and turn off search highlight in normal mode (non recursive)
nnoremap <C-L> :nohl<CR><C-L>
set ignorecase
set smartcase

" Indentation
" ===========
" softtabs de 4 columnas
" TODO mapping to switch from softtabs to actual tabs by reseting expandtab and
" softtabstop
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" autoindent -> smartindent -> cindent -> indentexpr (from less to more
" general, each one overrides the previous ones)
set smartindent	" This is a really nice and simple one
"set cindent		
"set cinoptions=:0,g0	" See C-indenting

" Automatic formatting
" ====================
" see fo-table
set formatoptions=rql
set formatoptions-=o		" Automatically insert the current comment leader 
				" after hitting 'o'.
set formatoptions+=t		" auto-wrap text (when inserting)
set formatoptions+=c		" auto-wrap comments (when inserting)
"set formatoptions+=a		" auto-formatting of paragraphs (always).  (this
				" messes with being able to '=====' underline
				" just below a section header comment.
set formatoptions+=p		" Don't break lines after '.'
set formatoptions+=n		" Allow lists
set formatoptions+=j		" Removes comment leader when joining lines

" Word wrap
" =========
set wrap
set linebreak
" To 'justify' comments or block of text (paragraph) use "gq{motion}" or
" "gp{motion}", where {motion} can be "[/", "]/", "ip", "i{", "a{".
set textwidth=80

" Other settings
" ==============
set mouse=a
" set cmdheight=1
" Always display the status line, even if only one window is displayed
set laststatus=2
set ruler
set encoding=utf-8

" Mappings
" ========
map <F7> :tabp<CR>
map <F8> :tabn<CR>
" TODO: Funcking unmap the F1 key
"unmap <F1>

" Yanking and pasting
" ===================
" TODO: map something to "+y (cut buffer) and "*y (selection buffer) while in
" visual mode.
"vmap <++> "+y	    " The yank to the cut buffer (clipboard)
"vmap <++> "*y	    " The yank to the selection buffer

" Buffers
" =======
set hidden
map <S-F7> :bNext<LF>
map <S-F8> :bnext<LF>

" Printing
" ========
set printoptions=paper:A4,duplex:long
" set printoptions+=number:y
" TODO: Figure out how to print multibyte encodings.  Enabling this settings
" produces errors.
" set printencoding=utf-8
" set printmbcharset=JIS_X_1990	" This allows Japanese characters to be printed
" set printmbfont=r:Noto-Sans-CJK-JP

" Additions
" =========
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
" ====
" TODO: map :h _argument_ to :h _argument_ <C-w>L<C-w>_  This makes help window
" to almost fill the super small screen.
