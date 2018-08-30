" Set mapleader
" let mapleader = ","

set nocompatible	" 不兼容vi
filetype off		" required

set autochdir       " 自动切换当前路径
" Color Setting {
"set colorcolumn=85	" 彩色显示第85行
"set cursorcolumn	" 光标垂直高亮
"set background=dark	" 使用color solarized
set cursorline		" 设置光标高亮显示
colorscheme detorte " 主题
"}

" Tab Setting {
set autoindent		" same level indent
set smartindent 	" next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"}

" Display
" set number          " 显示行号
" set guifont=Inconsolata:h18 "GUI界面里的字体 默认有抗锯齿
set relativenumber  " 相对行号 想要相对行号起作用要放在显示行号后面
set wrap            " 自动换行
set showmatch       " 显示括号对应
set laststatus=2    " 总是显示状态行
set t_Co=256		" 设置256色显示
set linespace=0
"}

" File Setting {
"set undofile        " 无限undo
"set nowrap          " 禁止自动换行
set encoding=utf-8  " 编码设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 编码设置
"}

" Vundle Setting {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" xml格式化插件
Bundle 'xml.vim'

" 代码片段插件
" Bundle 'UltiSnips'

" NERD 出品的快速给代码加注释的插件，选中，`ctrl+h` 即可注释多种语言代码
" Bundle 'The-NERD-Commenter' "试用tcomment
" let NERDShutUp=1    " 支持单行和多行的选择
" NERD 树状窗口 ctrlp 更强大，所以这个暂时取消不用了
" Bundle 'The-NERD-tree'
" autocmd VimEnter * NERDTree  " 程序启动后打开树状窗口
" map <F2> :NERDTreeToggle<CR> " 按下F2调出隐藏显示NERDTree
" let NERDTreeWinPos="right"   " 讲 NERDTree 的窗口设置在右侧
" let NERDTreeShowBookmarks=1  " 默认自动显示Bookmarks
" https://github.com/scrooloose/nerdtree 目录浏览插件

Bundle 'scrooloose/nerdtree'
let NERDTreeShowBookmarks=1 " 默认显示Bookmark
let NERDTreeShowLineNumbers=1 " 是否显示行号
map <F4> :silent! NERDTreeToggle<CR>

" 快读定位插件
Bundle 'EasyMotion'
let g:EasyMotion_leader_key = 'f'

" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'

" 超强的搜索打开文件插件
Bundle 'kien/ctrlp.vim'

" 状态栏美化显示插件 osx 下显示效果不好
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" 快速注释
" https://github.com/tomtom/tcomment_vim
Bundle 'tomtom/tcomment_vim'

" markdown
Bundle 'gabrielelana/vim-markdown'

" 代码补全 C C++
Bundle 'Valloric/YouCompleteMe'

" Tagbar
Bundle 'majutsushi/tagbar'
nmap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
autocmd BufReadPost *.go call tagbar#autoopen()

" markdown中代码显示
Bundle 'joker1007/vim-markdown-quote-syntax'
let g:markdown_quote_syntax_filetypes = {
    \ "go" : {
    \   "start" : "go",
    \},
    \ "c" : {
    \   "start" : "c",
    \},
\}

" Tagbar support golang
" go get -u github.com/jstemmer/gotags
" gotags setting
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Tagbar support markdown
" https://github.com/jszakmeister/markdown2ctags
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"}

" 放置在Bundle的设置后，防止意外Bug
filetype plugin indent on " required
syntax on

" 检查当前文件代码语法(php){{{
function! CheckPHPSyntax()
    if &filetype!='php'
        echohl WarningMsg | echo 'Fail to check syntax! Please select the right file!' | echohl None
        return
    endif
    " Check php syntax
    setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction
map <F3> :call CheckPHPSyntax()<CR>
" }}}
