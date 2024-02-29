"list of plugins , run :PlugInstall, :PlugUpdate, :PlugClean
call plug#begin('~/.vim/plugged')

  
  " naviguate folders
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs' " one tree for all tabs , run :NERDTreeTabsToggle

  " fold python code
Plug 'tmhedberg/SimpylFold'

  " syntax and indentation
"Plug 'vim-scripts/indentpython.vim'
"Plug 'neoclide/vim-jsx-improve'
"Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
  

  " generate python docstring with :Pydocstring
Plug 'pixelneo/vim-python-docstring'

  " auto-complete code, many languages
Plug 'ycm-core/YouCompleteMe'

  " make VIM aware of venv with :VirtualEnv[List,Activate] (source venv first)
Plug 'jmcantrell/vim-virtualenv'

  " git integration
  " run :Ggrep 'a word' for project-wide string search
Plug 'tpope/vim-fugitive'
  
  " show lines that changed with respect to last commit
  " see GitGutterDiffOrig, GitGutterFold
Plug 'airblade/vim-gitgutter' 

  " comment pieces of code with gcc (line), gc (motion)
Plug 'tpope/vim-commentary'

  " fuzzy search for file, buffer, mru, tag 
  " for file search run ctrl+P
  " then open file in new tab with ctrl+t
Plug 'ctrlpvim/ctrlp.vim'

  " powerline displays contextual information : venv name, branch name, 
  " vim mode (edit, insert,...), file position
Plug 'vim-airline/vim-airline'

  " color scheme
Plug 'crusoexia/vim-monokai'


" Initialize plugin system
call plug#end()


"drop vi compatibility to use vim features
set nocompatible

" Enable filetype detection for plugins and indentation options
filetype indent on
filetype plugin on 
syntax on

set number 	    " show line numbering
set noswapfile 	" disable the swapfile
set hlsearch 	  " highlight all results of a search
set incsearch 	" show search results as you type
set hidden 	    " enable buffer switch without being asked to save the file

" Mouse support
set mouse+=a
set ttymouse=sgr

" disable bell sound at tab completion (must also uncomment 'set bell-style none' in /etc/inputrc)
set visualbell
set t_vb=

" temporarily disable folding when you open the file
" folds can then be restored with zc
set nofoldenable

" yank support for WSL
let s:clip = '/mnt/c/Windows/System32/clip.exe'  
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif



""""""""""""""""""""""""""""""""""""""""""""
"		NERD TREE - FILE NAVIGUATION			
""""""""""""""""""""""""""""""""""""""""""""		
  " open at startup
 let g:nerdtree_tabs_open_on_console_startup=1






""""""""""""""""""""""""""""""""""""""""""""
"		PYTHON			
""""""""""""""""""""""""""""""""""""""""""""		
" follow PEP 8 
" au BufNewFile,BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set textwidth=79 |
"     \ set expandtab |
"     \ set autoindent |
"     \ set fileformat=unix

" red ruler at 80th column
set colorcolumn=80


" generate docstring with :Pydocstring 
let g:python_style = 'google'

""""""""""""""""""""""""""""""""""""""""""""
"		JAVASCRIPT			
""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType javascript set sw=2
" autocmd FileType javascript set ts=2
" autocmd FileType javascript set sts=2
" autocmd FileType javascript set textwidth=79



""""""""""""""""""""""""""""""""""""""""""""
"		GIT			
""""""""""""""""""""""""""""""""""""""""""""		
" dark gutter sign column 
let g:gitgutter_eager = 0   " disable signs update when buffer/tab is switched
highlight clear SignColumn
set updatetime=200 " update vimdiff every X ms


""""""""""""""""""""""""""""""""""""""""""""
"		COLOR SCHEME
""""""""""""""""""""""""""""""""""""""""""""		
colorscheme monokai

 

""""""""""""""""""""""""""""""""""""""""""""
"		AIR LINE			
""""""""""""""""""""""""""""""""""""""""""""		

" AIR LINE displays contextual info (vim mode, git branch, file pos...)
let g:airline_powerline_fonts = 1
  
  " display venv information in airline
let g:airline#extensions#virtualenv#enabled = 1 

  " overwrite symbols with unicode to avoid display glitches in WSL
  " comment this
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'Ξ'



""""""""""""""""""""""""""""""""""""""""""""
"		CTAGS	
""""""""""""""""""""""""""""""""""""""""""""		
" prerequesite : apt install universal-ctags 

" set tag file location
" ';' makes the search upward recursive till project root dir.
set tags=./tags; 

" jump to tag with CTRL-$ (FR). Selection promp if duplicate tags. 
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

" backtrack stack with CTRL-t



""""""""""""""""""""""""""""""""""""""""""""
"		KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""		

" define leader key 
let mapleader=","		

" navigate buffers with <Leader>b
nnoremap <Leader>b :buffers<CR>:buffer<Space>




