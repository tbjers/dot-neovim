call plug#begin()

Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'gabrielelana/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'neomake/neomake'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'StanAngeloff/php.vim'
Plug 'SirVer/ultisnips'
Plug 'tmux-plugins/tpm'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }
Plug 'edkolev/tmuxline.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

call plug#end()

filetype plugin indent on
syntax on

set encoding=utf8
set termencoding=utf8

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let itermScheme=$ITERM_PROFILE
if itermScheme == 'Light'
  set background=light
else
  set background=dark
end
colorscheme one
let g:airline_theme='one'
let g:one_allow_italics = 1

let g:airline_powerline_fonts=1
let g:airline_enable_fugitive=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tmuxline#enabled=0

let g:vim_markdown_folding_disabled=1

set number
set wrap!
set expandtab
set autoindent
set cindent
set smartindent
set nofoldenable
set tabstop=2
set shiftwidth=2
set pastetoggle=<F2>
set encoding=utf-8
set noswapfile
set backspace=indent,eol,start
set hlsearch
set incsearch
set listchars=tab:▶\ ,eol:¬,trail:·,nbsp:·,extends:→,precedes:←

set laststatus=2

nnoremap <silent> <C-^> :bn<CR>
nnoremap <silent> <leader>w :bw<CR>
nnoremap <silent> <C-s> :update<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <C-\> :NERDTreeToggle<CR>

autocmd BufNewFile,BufRead {Gemfile,Vagrantfile,Berksfile,Podfile} set filetype=ruby

let g:jsx_ext_required = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

autocmd FileType typescript :set makeprg=tsc

