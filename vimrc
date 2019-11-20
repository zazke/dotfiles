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
filetype plugin indent on 
syntax on
set wildmenu
set showcmd

" Options that aren't default in some systems
" ===========================================
set backspace=indent,eol,start

" Number gutter
" =============
set number
set relativenumber

" Search
" ======
set hlsearch
set incsearch
" Redraw and turn of search highlight in normal mode (non recursive)
nnoremap <C-L> :nohl<CR><C-L>
set ignorecase
set smartcase

" Indentation
" ===========
" softtabs de 4 columnas, no se expanden los tabs (util para tabular y para
" programar en assembler)
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent
set cindent

" Automatic formatting
" ====================
" see fo-table
set formatoptions=rql
set formatoptions-=o
set formatoptions+=t		" auto-wrap text (when inserting)
set formatoptions+=c		" auto-wrap comments (when inserting)
"set formatoptions+=a		" auto-formatting of paragraphs (always).  (this
				" messes with being able to '=====' underline
				" just below a section header comment

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

" Mappings
" ========
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Yanking and pasting
" ===================
" TODO: map something to "+y (cut buffer) and "*y (selection buffer) while in
" visual mode.
"vmap <++> "+y	    " The yank to the cut buffer (clipboard)
"vmap <++> "*y	    " The yank to the selection buffer


" Additions
" =========
" TODO: Funcion para reindentar archivo con mi configuracion.  Esta funcion de
" vim.fandom.com no se como funciona.  (Ver perlexpr?)
":command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
