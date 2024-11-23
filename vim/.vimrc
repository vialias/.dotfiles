set nu rnu
set ai
syntax on
set tabstop=4
set ls=2
set shiftwidth=4
set path+=**
set wildmenu
set nocompatible
filetype plugin on 
set laststatus=2
" set font and character size
set guifont=ProggyCleanTT\ 12
" set vimclipboard = systemclipboard
set clipboard=unnamedplus

" vim plug
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot' "Syntax higlighting für ALLE sprachen 
Plug 'rafi/awesome-vim-colorschemes' "selbserklärend
Plug 'preservim/nerdtree' " ,  { 'on': 'NERDTreeToggle' } "Filemanagement
Plug 'tpope/vim-commentary' "kommentarcommand
Plug 'ervandew/supertab' "tab insert help
Plug 'vim-airline/vim-airline' "status bar
Plug 'lervag/vimtex' "Latex extention (funktioniert atm nicht)
Plug 'tmhedberg/SimpylFold' "Folding plugin for phyton
Plug 'vimwiki/vimwiki' "tool für eigenes Wiki(leider keine latex visialisierung
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify' "tool für custom startnachricht
"Funktioniert nur so halb/ git status passt nicht so wirklich
"Plug 'bluz71/vim-mistfly-statusline'

call plug#end()

" colorschemes
color moonfly
" color focuspoint
" color 256_noir
" color afterglow
" color sunbather



" Startup NERDTree all the time
" autocmd VimEnter * NERDTree
" Sets the cursor in the newly opens window 
autocmd VimEnter * wincmd p"   
" enable NERDTree line numbers
let NERDTreeShowLineNumbers=1


" setzt ---| für jedes Tab-symbol ein! Aber muss mit :set list eingeschalten
" werden
" set list 
set lcs=tab:\|\-
" hotkey for tagbar
nmap <F8> :TagbarToggle<CR>

" remaps delete last word zurück zu normal (Control-Backspace)
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" removes bell alert :)
set belloff=all
