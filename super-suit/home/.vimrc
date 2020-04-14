set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sleuth'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdcommenter'
Plugin 'leafgarland/typescript-vim'
"Plugin 'prabirshrestha/async.vim'
"Plugin 'prabirshrestha/vim-lsp'
Plugin 'jez/vim-superman'
Plugin 'mileszs/ack.vim'
"Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'majutsushi/tagbar'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
Plugin 'lluchs/vim-wren'
Plugin 'SirVer/ultisnips'
if has('nvim')
    Plugin 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plugin 'shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set incsearch
syntax on
command! BTS new | only
command! Erc sp $MYVIMRC
command! Wc w | close
set autoindent
set smartindent
nnoremap <F5> :Ex<CR>
set termguicolors
colorscheme gruvbox
let g:airline_powerline_fonts = 1
set shiftwidth=4
set softtabstop=4
filetype on
set ignorecase
set smartcase
set relativenumber
set clipboard=unnamed
set ttyfast
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" neovim stuff
set encoding=utf-8
" deoplete
let g:deoplete#enable_at_startup = 1

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 25
"let g:netrw_browse_split = 4
"let g:netrw_preview = 1

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Goyo
let g:goyo_height = '100%'
let g:goyo_linenr = 1

" Go
let g:go_fmt_autosave = 0

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

"if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'))
    "au User lsp_setup call lsp#register_server({
	    "\ 'name': 'eclipse.jdt.ls',
	    "\ 'cmd': {server_info->[
	    "\     'java',
	    "\     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
	    "\     '-Dosgi.bundles.defaultStartLevel=4',
	    "\     '-Declipse.product=org.eclipse.jdt.ls.core.product',
	    "\     '-Dlog.level=ALL',
	    "\     '-noverify',
	    "\     '-Dfile.encoding=UTF-8',
	    "\     '-Xmx1G',
	    "\     '-jar',
	    "\     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'),
	    "\     '-configuration',
	    "\     expand('~/lsp/eclipse.jdt.ls/config_linux'),
	    "\     '-data',
	    "\     getcwd()
	    "\ ]},
	    "\ 'whitelist': ['java'],
	    "\ })
"endif
