if has('unix')
    let $MYVIMDIR = expand('$HOME/.config/nvim')
elseif has('win32')
    let $MYVIMDIR = expand('$LOCALAPPDATA/nvim')
endif

call plug#begin(expand('$MYVIMDIR/plugged'))

Plug 'reedes/vim-colors-pencil'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Rip-Rip/clang_complete'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'zchee/deoplete-jedi'
Plug 'osyo-manga/vim-anzu'

call plug#end()

nnoremap <silent> <Esc> :set hls!<Enter>
nnoremap / :set hls<Enter>/
nnoremap ? :set hls<Enter>?
nmap <silent> n <Plug>(anzu-n-with-echo)zv:set hls<Enter>
nmap <silent> N <Plug>(anzu-N-with-echo)zv:set hls<Enter>
nmap <silent> * <Plug>(anzu-star-with-echo)zv:set hls<Enter>
nmap <silent> # <Plug>(anzu-sharp-with-echo)zv:set hls<Enter>

nnoremap <silent> <Space>w :set wrap!<Enter>

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k
nnoremap Y y$

set number
set background=dark
set scrolloff=9999
set sidescrolloff=9999
set list
set listchars=eol:⏎,tab:>\ ,trail:␣,extends:»,precedes:»
set ignorecase
set smartcase
set gdefault
set breakindent
set backupcopy=yes
set termguicolors

if exists('+shellslash')
    set shellslash
endif

let g:deoplete#enable_at_startup = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:clang_library_path='/usr/lib/libclang.so'
let g:racer_cmd = '~/.cargo/bin/racer'
let $RUST_SRC_PATH=system('rustc --print sysroot')[:-2] . '/lib/rustlib/src/rust/src'

let g:ale_linters = {
	\ 'cpp': ['clang'],
	\ 'html': ['tidy'],
	\ 'rust': ['cargo'],
\}
let g:ale_fixers = {
	\ 'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1

colorscheme pencil
