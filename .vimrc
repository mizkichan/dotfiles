" .vimrc

" NeoBundle {{{
if has('vim_starting')
	setglobal runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'Shougo/neobundle.vim', { 'depends' : [ 'Shougo/vimproc' ] }

NeoBundle 'Shougo/unite.vim', { 'depends' : [ 'Shougo/vimproc' ] }
let g:unite_data_directory = '~/.vim/misc/unite'
NeoBundle 'thinca/vim-unite-history', { 'depends' : [ 'Shougo/unite.vim' ] }
NeoBundle 'ujihisa/unite-colorscheme', { 'depends' : [ 'Shougo/unite.vim' ] }

NeoBundleLazy 'nvie/vim-flake8', {
\	'autoload' : {
\		'filetypes' : [ 'python' ]
\	},
\	'build' : {
\		'unix' : 'pip install --user flake8'
\	}
\}

NeoBundleLazy 'davidhalter/jedi-vim', {
\	'autoload' : {
\		'filetypes' : [ 'python' ]
\	}
\}

NeoBundleLazy 'ehamberg/vim-cute-python', {
\	'autoload' : {
\		'filetypes' : [ 'python' ]
\	}
\}

NeoBundleLazy 'othree/html5.vim', {
\	'autoload' : {
\		'filetypes' : [ 'html' ]
\	}
\}

NeoBundle 'Shougo/vimproc', { 'build' : { 'unix' : 'make -f make_unix.mak' } }
NeoBundle 'chrisbra/SudoEdit.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'mattn/gist-vim', { 'depends' : [ 'mattn/webapi-vim' ] }
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'thinca/vim-quickrun', { 'depends' : [ 'Shougo/vimproc' ] }
NeoBundle 'thinca/vim-ref'
let g:ref_cache_dir = '~/.vim/misc/vim_ref_cache'
NeoBundle 'tyru/restart.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'tyru/open-browser.vim'
"}}}
" Options {{{
	" GUI {{{
	if has('gui_running')
		" フォント
		set guifont=M+\ 1mn\ medium\ 10

		" GUI オプションはだいたい無効
		set guioptions&
		set go-=a go-=e go-=g go-=m go-=r go-=L go-=t go-=T
		set go+=c go+=M
	endif
	" }}}
	" GじゃないUI {{{
		" カーソルのある行を強調
		set cursorline	" local

		" UI の区切り部品に使われる文字
		set fillchars=stl:\ ,stlnc:\ ,vert:\|,fold:\ ,diff:\ 

		" ステータス行を常に表示する
		set laststatus=2

		" 見えない文字の可視化
		set list	" local
		set listchars=eol:⏎,tab:>\ ,trail:␣,extends:»,precedes:«,conceal:\ ,nbsp:␣
		
		" 行番号を表示
		set number	" local

		" ルーラを表示
		set ruler

		" ルーラの書式
		set rulerformat=

		" 短縮表示するメッセージのリスト
		" a : 基本的なもの全て
		" o, O, T : メッセージは上書きしない
		" I : 起動時のウェルカムメッセージ
		" s : 〜まで検索したので〜に戻ります (vim-anzu が echo するので)
		set shortmess&
		set shm+=a shm-=o shm-=O shm-=T shm+=I shm+=s

		" 折り返された行の先頭に表示する文字列
		set showbreak=>

		" 未解決コマンドを表示する
		set showcmd

		" タブバーを常に表示する
		set showtabline=2

		" ステータス行の書式
		set statusline=

		" タブバーの書式
		set tabline=

		" タイトルバーの書式
		set titlestring=
	" }}}
	" 国際化 {{{
		" 迷ったら半角
		set ambiwidth=single

		" 内部エンコーディング
		set encoding=utf-8

		" 想定される文字エンコーディングのリスト
		set fileencodings=ucs-bom,utf-8,cp932,euc-jp

		" なんかよくわからんけどSKK動く
		set iminsert=2
	" }}}
	" バックアップ、セッション、ビュー、アンドゥ、スワップ {{{
		" バックアップを有効化
		set backup

		" 永続的アンドゥ履歴を有効
		set undofile	" local
		
		" バックアップ関係はプラットフォーム依存な部分がけっこうある
		if has('unix')
			" 属性やリンクの維持のため、UNIX系ではバックアップはコピーによって行う
			set backupcopy=yes

			" バックアップの保存先
			set backupdir=~/.vim/backup

			" アンドゥファイルの保存先
			set undodir=~/.vim/undo

			" ビューの保存先
			set viewdir=~/.vim/view

			" スワップの保存先
			set directory=./,~/.vim/swap
		endif
	"}}}
	" キー {{{
		" コマンドラインウィンドウを開くためのキーを無効
		set cedit=

		" 行末から行頭に移動できるキー
		set whichwrap=

		" Alt をメニューは使わない
		set winaltkeys=no
	" }}}
	" 検索・置換 {{{
		" 置換フラグ 'g' の効果を反転させる
		set gdefault

		" 起動時はハイライト無効
		set nohlsearch

		" 大文字と小文字を区別しない
		set ignorecase

		" インクリメンタルサーチ
		set incsearch

		" 新しい正規表現エンジンを使う
		set regexpengine=2

		" 大文字が含まれるときは大文字を区別する
		set smartcase
	"}}}
	" コマンドライン {{{
		" コマンドライン補完の拡張モード
		set wildmenu

		" コマンドライン補完のタブキーの挙動
		set wildmode=longest,full
	"}}}
	" インデント"{{{
		" シンプルな自動インデントを使う
		set autoindent	" local
	"}}}
	
	" マウスは使わない
	set mouse=

	" クリップボード
	set clipboard=

	" vi 互換オプション
	" c : 既にマッチしている範囲内からでも検索を開始する
	" / : 置換において置換後文字列を '%' で再利用できる
	set cpo-=c cpo+=/ 

	" diff モードのオプション
	set diffopt=filler,context:5,vertical

	" 折り返された見掛け上の1行をウィンドウの最後の行でも表示する。
	set display=lastline

	" コマンド履歴の数
	set history=100

	" 行連結の空白は常に1個
	set nojoinspaces

	" <C-a> や <C-x> で増減させる文字の種類
	set nrformats=alpha,octal,hex

	" 行変更報告は必ずしてほしい
	set report=0

	" カーソルの上下オフセット
	set scrolloff=9999

	" スクロール同期のオプション
	set scrollopt=ver,hor,jump

	" インデントを 'shiftwidth' の倍数の丸める
	set shiftround

	" 水平スクロールも1文字単位で行う
	set sidescroll=1

	" カーソルの左右オフセット
	set sidescrolloff=9999

	" 賢いタブ
	set smarttab

	" 新しいウィンドウは下に
	set splitbelow

	" 新しいウィンドウは左に
	set nosplitright

	" ジャンプ系コマンドで空白文字でもそこにジャンプする
	set nostartofline

	" 矩形選択でタブの内側も移動できる
	set virtualedit=block
" }}}
" Terminal {{{
	set t_Co=256
" }}}
" Color {{{
	NeoBundle 'tomasr/molokai'
	colorscheme molokai
	syntax on
" }}}
" Completion {{{
	NeoBundle 'Shougo/neocomplete', { 'depends' : [ 'Shougo/vimproc' ] }

	" neocomplete 有効
	let g:neocomplete#enable_at_startup = 1

	" データディレクトリ
	let g:neocomplete#data_directory = '~/.vim/misc/neocomplete'

	" 'iminsert' が 非0 のときに自動補完をロック
	let g:neocomplete#lock_iminsert = 1

	" 補完オプション
	set completeopt=menu,menuone,longest,preview
" }}}
" Auto Commands {{{
augroup vimrc_autocmd
	autocmd!
	" 世代バックアップ。バックアップファイルの拡張子を日付にすることで上書きを回避する
	autocmd BufWritePre * let &l:backupext = '-' . substitute(expand("%:p"), "/", "%", "g") . '-' . strftime("%y%m%d%H%M%S")
	" テンプレ。プラギンにありそう
	autocmd BufNewFile *.py 0r ~/.vim/template/python.txt
	autocmd BufNewFile *.html 0r ~/.vim/template/html.txt
augroup END
" }}}
" Mapping {{{
" Unite
nnoremap <Space><Space> :Unite<Space>

" カーソル移動に gj を使用する
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k

" ハイライトのトグル
nnoremap <silent> <Esc> :setlocal hlsearch!<CR>

" 検索開始時に 'hlsearch' を入
nnoremap / :setlocal hlsearch<CR>/
nnoremap ? :setlocal hlsearch<CR>?

" anzu
nmap <silent> n <Plug>(anzu-n-with-echo)zv:setlocal hlsearch<CR>
nmap <silent> N <Plug>(anzu-N-with-echo)zv:setlocal hlsearch<CR>
nmap <silent> * <Plug>(anzu-star-with-echo)zv:setlocal hlsearch<CR>
nmap <silent> # <Plug>(anzu-sharp-with-echo)zv:setlocal hlsearch<CR>

" 行番号相対表示のトグル
nnoremap <silent> <Space>n :setlocal relativenumber!<CR>

" 'colorcolumn' に追加
nnoremap <silent> <Space>c :call ToggleColorColumn(virtcol('.'))<CR>
function! ToggleColorColumn(column)
	" a:column を 'colorcolumn' に追加または削除
	" exec 使うのアレだよね
	if match(split(&l:colorcolumn, ","), a:column) == -1
		execute 'setlocal colorcolumn+=' . a:column
	else
		execute 'setlocal colorcolumn-=' . a:column
	endif
endfunction

" 'colorcolumn' をクリア
nnoremap <silent> <Space>C :setlocal colorcolumn=<CR>

" スクロール同期の切り換え
nnoremap <silent> <Space>b :setlocal cursorbind!<CR>

" 'wrap' の切り換え
nnoremap <silent> <Space>w :setlocal wrap!<CR>

" Gundo
nnoremap <silent> <Space>u :GundoToggle<CR>

" 日付挿入
nnoremap <silent> <Space>d "=strftime('%F')<CR>p
inoremap <silent> <C-Space>d <C-r>=strftime('%F')<CR>
" }}}

filetype plugin indent on

" vim: fdm=marker
