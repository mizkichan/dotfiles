if has('unix')
    let $MYVIMDIR = expand('$HOME/.config/nvim')
    let $DATADIR = expand('$HOME/.local/share/nvim')
elseif has('win32')
    let $MYVIMDIR = expand('$LOCALAPPDATA/nvim')
    let $DATADIR = expand('$LOCALAPPDATA/nvim-data')
endif

call plug#begin(expand('$MYVIMDIR/plugged'))

Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'osyo-manga/vim-anzu'
Plug 'reedes/vim-colors-pencil'
Plug 'tpope/vim-surround'

Plug 'ElmCast/elm-vim'
Plug 'arrufat/vala.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-scripts/ebnf.vim'
Plug 'justinmk/vim-syntax-extra'

call plug#end()

nnoremap <silent> <Esc> :set hls!<Enter>
nnoremap / :set hls<Enter>/
nnoremap ? :set hls<Enter>?
nmap <silent> n <Plug>(anzu-n-with-echo)zv:set hls<Enter>
nmap <silent> N <Plug>(anzu-N-with-echo)zv:set hls<Enter>
nmap <silent> * <Plug>(anzu-star-with-echo)zv:set hls<Enter>
nmap <silent> # <Plug>(anzu-sharp-with-echo)zv:set hls<Enter>

nnoremap <silent> <Space>w :set wrap!<Enter>

noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k
nnoremap Y y$

set number
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
set splitright
set hidden
set undofile
set backup
set backupdir=$DATADIR/backup
set omnifunc=ale#completion#OmniFunc
set cursorline
set completeopt+=noselect

let g:vala_syntax_folding_enabled = 0

" elm-vim does unnecessary things...
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \ 'c': ['clangd'],
            \ 'cpp': ['clangd'],
            \ 'elm': ['elm_ls'],
            \ 'python': ['pyls', 'mypy'],
            \ 'rust': ['rls'],
            \ 'sh': ['language_server'],
            \ 'typescript': ['tsserver'],
            \ 'typescriptreact': ['tsserver'],
            \ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \ 'c': ['clang-format'],
            \ 'cpp': ['clang-format'],
            \ 'css': ['prettier'],
            \ 'elm': ['elm-format'],
            \ 'go': ['gofmt'],
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'javascriptreact': ['prettier'],
            \ 'json': ['prettier'],
            \ 'python': ['black'],
            \ 'rust': ['rustfmt'],
            \ 'scss': ['prettier'],
            \ 'sh': ['shfmt'],
            \ 'typescript': ['prettier'],
            \ 'typescriptreact': ['prettier'],
            \ 'yaml': ['prettier'],
            \ }

command! -nargs=+ -complete=file TabEdit :call TabEdit(<f-args>)
function! TabEdit(...) abort
   for l:arg in a:000
       for l:path in glob(l:arg, 0, 1)
           if isdirectory(l:path)
                continue
            endif
           execute 'tabedit' l:path
       endfor
   endfor
endfunction

command! -nargs=? -complete=file WriteWithoutFix :call WriteWithoutFix(<f-args>)
function! WriteWithoutFix(...) abort
    let l:ale_fix_on_save = g:ale_fix_on_save
    let g:ale_fix_on_save = 0
    if a:0 == 0
        write
    else
        write a:1
    endif
    let g:ale_fix_on_save = l:ale_fix_on_save
endfunction

augroup vimrc
	autocmd!
	autocmd BufWritePre * let &l:backupext = '-' . substitute(expand("%:p"), "/", "%", "g") . '-' . strftime("%y%m%d%H%M%S")
augroup END

colorscheme pencil
" vim: set ts=4 sw=4 et:
