if has('unix')
    let $MYVIMDIR = expand('$HOME/.config/nvim')
elseif has('win32')
    let $MYVIMDIR = expand('$LOCALAPPDATA/nvim')
    let $HOME = expand('$HOME')
endif

call plug#begin(expand('$MYVIMDIR/plugged'))

" いらなくね？
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" 本当は LSP を使いたい
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go'
Plug 'Rip-Rip/clang_complete'

Plug 'reedes/vim-colors-pencil'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'osyo-manga/vim-anzu'

Plug 'rust-lang/rust.vim'

Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ }

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
set hidden

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" 補完・整形・lint
" - LSP が使える言語
"   - 全て LSP 経由
"   - ALE は使わない
" - LSP が使えない言語
"   - 補完用に個別のプラグインを追加 
"   - 整形コマンドと lint は ALE 経由

let g:LanguageClient_serverCommands = {
            \ 'rust': [expand('$HOME/.cargo/bin/rustup'), 'run', 'nightly', 'rls'],
            \ }

let g:deoplete#enable_at_startup = 1
let g:clang_library_path = '/usr/lib/libclang.so'

let g:ale_linters = {
            \ 'cpp': ['clang'],
            \ 'html': ['tidy'],
            \}
let g:ale_fixers = {
            \ 'go': ['gofmt'],
            \ 'python': ['yapf'],
            \}
let g:ale_fix_on_save = 1

" LSP でフォーマットをかける
augroup format
    autocmd!
    autocmd BufWritePre * silent! call LanguageClient#textDocument_rangeFormatting_sync()
augroup END

colorscheme pencil
" vim: set ts=4 sw=4 et:
