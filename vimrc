" Shit that gets disabled because I created this file
set nocompatible
filetype indent plugin on
syntax on
set wildmenu
set showcmd

" Numbers
set number

" Search
set hlsearch
	
" Indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set autoindent
set smartindent

" Word wrap
set wrap
set linebreak
" TODO: Figure out how to quickly 'justify' comments or block of
" text.  Auto-text wrapping is a  really nice feature, but how can I edit C comments 
" without leaving some lines short?
set textwidth=80
" set wrapmargin=0
" set formatoptions-=t

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

" ? Map <C-L> (redraw screen) to also turn off search highlighting until the 
" next search
nnoremap <C-L> :nohl<CR><C-L>
