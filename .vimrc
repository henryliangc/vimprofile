set t_Co=256
set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

"""""""""""""""""""  gutentags related start """"""""""""""""""
" let g:gutentags_define_advanced_commands = 1
let $GTAGSLABEL='native'
let $GTAGSCONF = "/usr/local/share/gtags/gtags.conf"
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
endif
 
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
"""""""""""""""""""  gutentags related end """"""""""""""""""



"""""""""""""""""""  Vundle related  start """"""""""""""""""
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 " 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名'
" 只是此处的用户名可以省略
" Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-clang-format'
" Plugin 'git://git.wincent.com/command-t.git'
 " 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'ajh17/vimcompletesme'
" Plugin 'file:///home/yaoling.lc/.vim/bundle/LanguageClient-neovim'
" Plugin 'jsfaint/gen_tags.vim'
" Plugin 'skywind3000/vim-auto-popmenu'
" Plugin 'ycm-core/YouCompleteMe'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall       - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后
"""""""""""""""""""  Vundle related  end  """"""""""""""""""

""""""""""""""""""" gtags related  start  """"""""""""""""""
"gtags 设置项
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
set csprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
cs add "~/.cache/tags/flash1-yaoling.lc-PolarDB_802/GTAGS"
""""""""""""""""""" gtags related  end  """"""""""""""""""



""""""""""""""""""" taglist related start  """"""""""""""""""
" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type="name"

let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
nnoremap <silent> <F8> :TlistToggle<CR>
""""""""""""""""""" taglist related  end  """"""""""""""""""



""""""""""""""""""" auto-complete related start  """"""""""""""""""
" omnicppcomplete
set completeopt=longest,menu
let OmniCpp_MayCompleteDot=1    "打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_NamespaceSearch = 2 " search namespaces in the current buffer and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2    "自动弹出时自动跳至第一个
let OmniCpp_ShowPrototypeInAbbr=1  "打开显示函数原型
""""""""""""""""""" auto-complete related end  """"""""""""""""""

""""""""""""""" auto complete local file related start  """"""""""""
"  设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b

" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c
""""""""""""""" auto complete local file related end  """"""""""""



""""""""""""""""""" nerdtree related start  """"""""""""""""""
map <F2> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
""""""""""""""""""" nerdtree related end  """"""""""""""""""

set colorcolumn=80
let g:clang_format#auto_format_on_insert_leave=1
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

""""""""""""""""""" display related start  """"""""""""""""""
set wildmode=longest,list " Ex命令自动补全采用bash方式"
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set nu
set hlsearch
set showmatch
set laststatus=2
set undofile
" set cursorcolumn
set cursorline
syntax on
set mouse=a

hi CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" pathongen
execute pathogen#infect()

let g:miniBufExplMaxSize = 2
  
nnoremap <silent> <F5> :A<CR>

" colorscheme desert
set bg=dark
colorscheme gruvbox
set backspace=indent,eol,start

" highlight trailing spaces as errors
let c_space_errors=1
""""""""""""""""""" display related end  """"""""""""""""""

