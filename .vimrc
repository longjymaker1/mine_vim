


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    快捷键记录
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader=\  如果修改可以 
" let mapleader=","

" F3 开启/关闭 文件树
" F4 开启/关闭 taglist
" F5 打开历史打开过的文件列表
" F6 打开/关闭 winmanager
" F10 更新taglist 

" taglist快捷键
" <CR>          跳到光标下tag所定义的位置，用鼠标双击此tag功能也一样
" o             在一个新打开的窗口中显示光标下tag
" <Space>       显示光标下tag的原型定义
" u             更新taglist窗口中的tag
" s             更改排序方式，在按名字排序和按出现顺序排序间切换
" x             taglist窗口放大和缩小，方便查看较长的tag
" +             打开一个折叠，同zo
" -             将tag折叠起来，同zc
" *             打开所有的折叠，同zR
" =             将所有tag折叠起来，同zM
" [[            跳到前一个文件
" ]]            跳到后一个文件
" q             关闭taglist窗口
" <F1>          显示帮助



" NERD_Commenter 加/解注释快捷键
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>ca 切换注释的样式:/*....*/和//..的切换
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)
" <leader>cs  '性感的'注释(我很喜欢这个!)


" sl 左右切分 光标停留在右侧窗口
" sh 左右切分 光标停留在左侧窗口 
" sk 上下切分 光标停留在上方窗口
" sj 上下切分 光标停留在下方窗口

" <LEADER>l 空格+l 切换右侧窗口
" <LEADER>k 空格+k 切换上方窗口
" <LEADER>h 空格+h 切换左侧窗口
" <LEADER>j 空格+j 切换下方窗口




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    默认配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime! debian.vim
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    基本配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
let mapleader=" "
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set cursorline
set ruler
set nobackup
set nocompatible "关闭vi兼容模式
set nowrap " 没有自动折叠
set showmatch " 现实匹配的括号
set encoding=utf-8
set fenc=utf-8
set mouse=a
set hlsearch " 搜索突出
set expandtab
set autoindent " 自动缩进
set backspace=2 " 设置 backspace可以删除任意字符
map S :w<CR>  " 保存
map Q :q<CR>  " 推出
map R :source $MYVIMRC<CR>  " 刷新配置

set showcmd
set wildmenu
let &t_ut=''

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    窗口切分
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow

" 窗口切换
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR> 

" 切换窗口
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j









""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    代码折叠
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
set foldmethod=indent
set foldlevel=99

" 空格+za折叠快捷键
nnoremap <space> za




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    插件安装
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 也可以传递一个Vundle应该安装插件的路径    
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
" markdown插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" 文件树
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" bufexplorer  可以打开历史文件列表以达到快速切换文件的目的
 Plugin 'jlanzarotta/bufexplorer'
" 括号颜色
Plugin 'frazrepo/vim-rainbow'
" 快速注释解开
Plugin 'preservim/nerdcommenter'
" github
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'mhinz/vim-signify'
Plugin 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" 补全引号
Plugin 'Raimondi/delimitMate'
" 补全路径
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" 主题插件
Plugin 'altercation/vim-colors-solarized'

" html5
Plugin 'othree/html5.vim'
" css3
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
" JS
Plugin 'pangloss/vim-javascript'
Plugin 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'



" 语法高亮&语法检查

Plugin 'sheerun/vim-polyglot'
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'

" repl 运行
Plugin 'sillybun/vim-repl'
" YouCompleteMe
Plugin 'VundleVim/YouCompleteMe'



call vundle#end()            " required
filetype plugin indent on    " required



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""   插件安装  """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    NERTTree 文件树
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    ctags & taglist配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctags
set tags=tags
set autochdir
set tags=/home/longjy/Pro/tags

" taglist
let Tlist_Show_One_File=1  " 不同时现实多个文件的tag, 只现实当前文件的
let Tlist_Exit_OnlyWindow=1  " 如果taglist窗口是最后一个窗口, 则推出vim
let Tlist_USE_Right_Window=1  " 在右侧窗口中现实taglist窗口


function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction

nmap <F10> :call UpdateCtags()<CR>
nmap <F4> :TlistToggle<CR>


" nnoremap <leader>r :REPLToggle<Cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    bufexplorer 打开历史文件列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:bufExplorerDefaultHelp=0       " 不显示默认帮助
let g:bufExplorerShowRelativePath=1  " 显示相对路径
let g:bufExplorerSortBy='mru'        " 按最近使用排序
let g:bufExplorerSplitRight=0        " 左侧
let g:bufExplorerSplitVertical=1     " 垂直
let g:bufExplorerSplitVertSize = 30  " 宽度
" let g:bufExplorerUseCurrentWindow=0  " Open in new window.
let g:bufExplorerDisableDefaultKeyMapping =0 " 不禁用默认键映射
nnoremap <silent> <F5> :BufExplorer<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    vim-Rainbow 括号颜色
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    winManager 整合taglist&fileExplorer&bufExplorer窗口
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置winmanager的宽度，默认为25 
let g:winManagerWidth = 30

"定义打开关闭winmanager按键 
nmap <silent> <F6> :WMToggle<CR>
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'
let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    NERD_commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDCreateDefaultMappings = 1  " 创建默认映射
let g:NERDSpaceDelims = 1  " 默认在注释后添加空格
let g:NERDCompactSexyComs = 1  " 使用见解的语法修饰注释
let g:NERDDefaultAlign = 'left'  " 按行对齐注释分隔符左对齐，而不是跟在代码缩进后面
let g:NERDAltDelims_java = 1  " 设置一种默认使用其替代分隔符的语言
let g:NERDCustomDelimiters = {'c': { 'left': '/**','right': '*/' }}  " 添加您自己的自定义格式或覆盖默认格式
let g:NERDCommentEmptyLines = 1  " 允许注释和倒转空行(注释区域时很有用)
let g:NERDTrimTrailingWhitespace = 1  " 在取消注释时，允许修剪尾部空白
let g:NERDToggleCheckAllLines = 1  " 使NERDCommenterToggle检查所有选定的行是否注释


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Shougo/deoplete.nvim 路径补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    配置主题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark

if $COLORTERM == 'truecolor'
    set termguicolors
    colorscheme s
else
    set term=xterm
    set t_Co=256
    colorscheme solarized
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Shougo/deoplete.nvim 路径补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


augroup VimCSS3Syntax
  autocmd!
 
  autocmd FileType css setlocal iskeyword+=-
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Shougo/deoplete.nvim 路径补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = " "
let g:javascript_conceal_underscore_arrow_function = " "
set conceallevel=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    语法高亮&语法检查
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    快速执行
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F8> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    REPL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

" let g:repl_width = None                           "窗口宽度
let g:repl_height = 7                          "窗口高度
let g:sendtorepl_invoke_key = "<leader>w"          "传送代码快捷键，默认为<leader>w
let g:repl_position = 0                             "0表示出现在下方，1表示出现在上方，2在左边，3在右边
let g:repl_stayatrepl_when_open = 0         "打开REPL时是回到原文件（1）还是停留在REPL窗口中（0）



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Virtualenv虚拟环境
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置自动缩进的宽度为4个空格
set ts=4
set sw=4
"显示行号
set nu
"搜索高亮
set hls
"将tab转化为空格，兼容python语言
set et
"设置字符集，通常用于windows环境
set encoding=utf-8
"括号和引号的自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    flake8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1












