" Set mapleader
let mapleader=","
let g:mapleader=","

set nocompatible	" 不兼容vi
filetype off		" required

set autochdir       " 自动切换当前路径
" Color Setting {
"set colorcolumn=85	" 彩色显示第85行
"set cursorcolumn	" 光标垂直高亮
"set background=dark	" 使用color solarized
set cursorline		" 设置光标高亮显示
" colorscheme detorte " 主题
colo seoul256
set background=dark
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
" set relativenumber  " 相对行号 想要相对行号起作用要放在显示行号后面
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

" Map Setting {
    map <F3> :Ack! -i 
    " map <F3> :call CheckPHPSyntax()<CR>
    map <F4> :silent! NERDTreeToggle<CR>
    nmap <silent> <F5> :TagbarToggle<CR>
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
" }

" Plug Setting {
call plug#begin('~/.vim/plugged')

" 安心写作插件，
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'

Plug 'scrooloose/nerdtree'
let NERDTreeShowBookmarks=1 " 默认显示Bookmark
let NERDTreeShowLineNumbers=0 " 是否显示行号

" 快读定位插件 " 使用vim-sneak代替
Plug 'justinmk/vim-sneak'

" 状态栏美化显示插件 osx 下显示效果不好
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" 快速注释
" https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim'

" markdown
Plug 'gabrielelana/vim-markdown'

" 代码补全 C C++
" Plug 'Valloric/YouCompleteMe'

" Tagbar
Plug 'majutsushi/tagbar'
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
" autocmd BufReadPost *.go call tagbar#autoopen()

" vim 支持Go开发
Plug 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)

" https://github.com/junegunn/fzf
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" ack and ag vim plugin
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" 代码排版
Plug 'junegunn/vim-easy-align'

" markdown中代码显示
Plug 'joker1007/vim-markdown-quote-syntax'
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

Plug 'Valloric/YouCompleteMe'

" ycm
"set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
"let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

call plug#end()
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
" }}}
