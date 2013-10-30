set nocompatible	" 不兼容vi
filetype off		" required

" Color Setting {
"set colorcolumn=85	" 彩色显示第85行
"set cursorcolumn	" 光标垂直高亮
set t_Co=256		" 设置256色显示
set background=dark	" 使用color solarized
set cursorline		" 设置光标高亮显示
colorscheme solarized " 主题
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
"}

" 放置在Bundle的设置后，防止意外Bug
filetype plugin indent on " required
syntax on
