set nocompatible	" 不兼容vi
filetype off		" required

set autochdir       " 自动切换当前路径
" Color Setting {
"set colorcolumn=85	" 彩色显示第85行
"set cursorcolumn	" 光标垂直高亮
set t_Co=256		" 设置256色显示
set background=dark	" 使用color solarized
set cursorline		" 设置光标高亮显示
colorscheme molokai " 主题
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
"set number          " 显示行号
"set guifont=Inconsolata:h12 "GUI界面里的字体 默认有抗锯齿
set relativenumber  " 相对行号 想要相对行号起作用要放在显示行号后面
set wrap            " 自动换行
set showmatch       " 显示括号对应
set laststatus=2    " 总是显示状态行
set linespace=0
"}

" File Setting {
"set undofile        " 无限undo
"set nowrap          " 禁止自动换行
set encoding=utf-8  " 编码设置
set fileencodings=ucs-bom,utf-8,utf-16,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 编码设置
"}

" Vundle Setting {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" xml格式化插件
Bundle 'xml.vim'

" NERD 出品的快速给代码加注释的插件，选中，`ctrl+h` 即可注释多种语言代码
Bundle 'The-NERD-Commenter'
let NERDShutUp=1    " 支持单行和多行的选择

" NERD 树状窗口 ctrlp 更强大，所以这个暂时取消不用了
" Bundle 'The-NERD-tree'
" autocmd VimEnter * NERDTree  " 程序启动后打开树状窗口
" map <F2> :NERDTreeToggle<CR> " 按下F2调出隐藏显示NERDTree
" let NERDTreeWinPos="right"   " 讲 NERDTree 的窗口设置在右侧
" let NERDTreeShowBookmarks=1  " 默认自动显示Bookmarks

" 代码补全 C C++
" Bundle 'Valloric/YouCompletMe'

" 代码片段插件
" Bundle 'UltiSnips'

" 快读定位插件
Bundle 'EasyMotion'

" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'

" markdown 语法
Bundle 'plasticboy/vim-markdown'

" 超强的搜索打开文件插件
Bundle 'kien/ctrlp.vim'

" 状态栏美化显示插件 osx 下显示效果不好
Bundle 'bling/vim-airline'
" set guifont=Droid\ Sams\ Mono\ for\ Powerline:h20
"}

" 放置在Bundle的设置后，防止意外Bug
filetype plugin indent on " required
syntax on
