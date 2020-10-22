"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread

" 行番号を表示
set number
" タブは半角スペースに変換
set expandtab
" タブ数4
set tabstop=4
set softtabstop=4
set shiftwidth=4
" インデントはスマートインデント
set smartindent
set autoindent
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 言語別設定
augroup fileTypeIndent
  autocmd!
  autocmd BufRead,BufNewFile *.go setlocal noexpandtab 
  autocmd BufRead,BufNewFile *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" load plugin config
runtime! config/*.vim
