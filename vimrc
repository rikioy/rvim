" Set mapleader
let mapleader = ","

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)

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
let g:zenburn_force_dark_Background=1
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
set guifont=Inconsolata:h18 "GUI界面里的字体 默认有抗锯齿
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
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 编码设置
"}

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
call vundle#end() 

let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>
" 放置在Bundle的设置后，防止意外Bug
filetype plugin indent on " required
syntax on
