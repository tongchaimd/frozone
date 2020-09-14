"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/bird/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/bird/.cache/dein')
  call dein#begin('/home/bird/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/bird/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('tpope/vim-sleuth')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('scrooloose/nerdcommenter')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set incsearch
syntax on
command! Erc sp $MYVIMRC
set autoindent
set smartindent
nnoremap - :Ex<CR>
set termguicolors
colorscheme gruvbox
let g:airline_powerline_fonts = 1
set tabstop=4
set shiftwidth=4
filetype on
set ignorecase
set smartcase
set relativenumber
set clipboard=unnamed
set ttyfast
set backupdir=~/.local/share/nvim/backups
set directory=~/.local/share/nvim/swaps
if exists("&undodir")
	set undodir=~/.local/share/nvim/undo
endif

" neovim stuff
set encoding=utf-8

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 25
"let g:netrw_browse_split = 4
"let g:netrw_preview = 1

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" color hack
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" nvim
if !has('nvim')
    set ttymouse=xterm2
endif

augroup vimrcAutoReload
	autocmd!
	autocmd Filetype netrw nnoremap <buffer> <Tab> <C-W><C-W>
	autocmd BufWritePost $MYVIMRC so $MYVIMRC | redraw | echom "Reloaded"
	 \. " rc" . " (" . $MYVIMRC . ")"
augroup end

command! FormatJson %!python -m json.tool
