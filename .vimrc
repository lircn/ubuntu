if (has("win32") || has("win95") || has("win64") || has("win16") || has("win32unix"))
    let g:OS#name = "win"
    let g:OS#win = 1
    let g:OS#mac = 0
    let g:OS#unix = 0
    let g:iswindows = 1
elseif has("mac")
    let g:OS#name = "mac"
    let g:OS#mac = 1
    let g:OS#win = 0
    let g:OS#unix = 0
    let g:iswindows = 0
elseif has("unix")
    let g:OS#name = "unix"
    let g:OS#unix = 1
    let g:OS#win = 0
    let g:OS#mac = 0
    let g:iswindows = 0
endif
if has("gui_running")
    let g:OS#gui = 1
else
    let g:OS#gui = 0
endif

set nocompatible

if g:OS#win
    " MyDiff {{{
    set diffexpr=MyDiff()
    function MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          let cmd = '""' . $VIMRUNTIME . '\diff"'
          let eq = '"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

function! Jump2DiffText(dir)
    if a:dir=="prev"
        exec "normal [c"
    elseif a:dir=="next"
        exec "normal ]c"
    endif
    if synIDattr(diff_hlID(".", col(".")), "name")=="DiffChange"
        let line=line(".")
        let cols=col("$")-1
        let idx=1
        while idx<=cols
            if synIDattr(diff_hlID(line, idx), "name")=="DiffText"
                call setpos(".", [0,line,idx])
                echo line.",".idx.",".cols
                break
            else
                let idx = idx+1
            endif
        endwhile
    endif
endfunction

" @see http://vim.wikia.com/wiki/Selecting_changes_in_diff_mode
if &diff
    nmap <buffer> <F7> :call Jump2DiffText("prev")<cr>
    nmap <buffer> <F8> :call Jump2DiffText("next")<cr>
else
    map <buffer> <F7> :cp<cr>
    map <buffer> <F8> :cn<cr>
endif

"cnoremap js javascript
"cnoremap vm velocity
"cabbrev js javascript
"cabbrev vm velocity
"cabbrev utf set fenc=utf8
"cabbrev utf8 set fenc=utf8
"cabbrev gbk set fenc=gbk

" }}}

" -------------------------------- Settings ----------------------------- {{{
" quick startup mode.
"set shortmess=atI

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,chinese,latin-1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 文件格式，默认 ffs=dos,unix
set fileformat=unix
set fileformats=unix,dos,mac

hi TabLine     cterm=none ctermfg=lightgrey ctermbg=lightblue guifg=gray guibg=black
hi TabLineSel  cterm=none ctermfg=lightgrey ctermbg=LightMagenta guifg=white guibg=black
hi TabLineFill cterm=none ctermfg=lightblue ctermbg=lightblue guifg=black guibg=black


" @see :help mbyte-IME
if has('multi_byte_ime')
    highlight Cursor guibg=#F0E68C guifg=#708090
    highlight CursorIM guibg=Purple guifg=NONE
endif


" auto mkview and loadview.
if !&diff
    au BufWinLeave *.js,*.css silent mkview
    au BufWinEnter *.js,*.css silent loadview
endif


" Tabs
set softtabstop=4
set expandtab       " replace tab to whitespace.
set tabstop=4       " show tab indent word space.
set shiftwidth=4    " tab length


"set linebreak       " break full word.
set smartindent


set splitright
"set splitbelow


" fixed.
set scrolloff=3

if g:OS#gui
    set autochdir
    set colorcolumn=81
endif


" file
set noswapfile " 不生成swap文件

set nowb
set nobackup " 不生成备份文件


""""""""""""powerline""""""""""""
set t_Co=256

set rtp+=/home/lizheng/.vim/bundle/powerline/powerline/bindings/vim
set guifont=PowerlineSymbols\ for\ Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'
let Powerline_symbols='compatible'


"""""""""""""""""""""""""""""常规设置""""""""""""""""""""""""""""""""""
let mapleader = ","
" 设置leader为',',默认为„\
let g:mapleader = ","

" 编辑过程中，在右下角显示光标位置的状态行
set ruler

" 查询/xx
set incsearch
" 去掉错误响声
set vb t_vb=
" 允许鼠标
set mouse=a
" 将tab显示为>-,尾行空格显示为-
set listchars=tab:>-,trail:-
set list

""""""""""""""""""""""""""""""编程设置""""""""""""""""""""""""""""'
" no自动换行
set nowrap
" 允许退格键
set backspace=indent,eol,start whichwrap+=<,>,[,]
" 自动缩进
set ai!
" 显示行号
set nu!
" 设置匹配模式
set showmatch

set showmode
set showcmd

" 自动匹配文件
filetype plugin on
if has("autocmd") " 根据文件缩进
    filetype plugin indent on
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g'\"" |
                    \ endif
    augroup END
else " always set autoindent on
    set autoindent
endif " has("autocmd")



""""""""""""""""""""""""""ctags和cscope(绑定F12)""""""""""""""""""""""""""
" set tags=tags;
" set autochdir
map <F12> :call Do_CsTag()<CR>
nmap <F5>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F5>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F5>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F5>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <F5>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <F5>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <F5>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <F5>d :cs find d <C-R>=expand("<cword>")<CR><CR>
function Do_CsTag()
	let dir = getcwd()
	if filereadable("tags")
		if(g:iswindows == 1)
			let tagsdeleted = delete(dir."\\"."tags")
		else
			let tagsdeleted = delete("./"."tags")
		endif
		if(tagsdeleted != 0)
			echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
			return
		endif
	endif
	if has("cscope")
		silent! execute "cs kill -1"
	endif
	if filereadable("cscope.files")
		if(g:iswindows==1)
			let csfilesdeleted=delete(dir."\\"."cscope.files")
		else
			let csfilesdeleted=delete("./"."cscope.files")
		endif
		if(csfilesdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
			return
		endif
	endif
	if filereadable("cscope.out")
		if(g:iswindows==1)
			let csoutdeleted=delete(dir."\\"."cscope.out")
		else
			let csoutdeleted=delete("./"."cscope.out")
		endif
		if(csoutdeleted!=0)
			echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
			return
		endif
	endif
	if(executable('ctags'))
		silent! execute "!ctags -R --c-kinds=+p --fields=+S *"
		" execute "!ctags -R --c++-kinds=-p --fields=+iaS --extra=+q ."
	endif
	if(executable('cscope')&&has("cscope"))
		if(g:iswindows!=1)
			silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		else
			execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
		endif
		execute "!cscope -Rb"
		execute "normal :"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
endfunction

"""""""""""""""""""""""进行taglist设置"""""""""""""""""""""
" TlistUpdate可以更新tags
" F3呼出
map <F3> :Tlist<CR>
let Tlist_Ctags_Cmd='ctags' " 因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 " 让窗口显示在右边，0的话就是显示在左边
"let Tlist_Use_Horiz_Window=1
let Tlist_Show_One_File=1 " 可同时展示多文件的函数列表，如果想只有1个，设置1
let Tlist_File_Fold_Auto_Close=1 " 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 " 当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 " 是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

"""""""""""""""""""""""NERD_commenter设置""""""""""""""""
let NERDShutup=1 "支持单行和多行的选择，//格式
"map <C-h> ,c<space>


"""""""""""""""""""""""""NERDTree""""""""""""""""""""""""
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=20
map <F2> :NERDTree<CR> "F2打开NERDTree 
map <F4> :NERDTreeClose<CR> "F4关闭

""""""""""""""""""""""""括号和引号补全"""""""""""""""""""
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O

"autocmd Syntax html,vim inoremap < <lt>><Esc>i | inoremap > <c-r>=ClosePair('>')<CR>

inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <C-r>=ClosePair(']')<CR>
inoremap } <C-r>=CloseBracket()<CR>
inoremap " <C-r>=QuoteDelim('"')<CR>
inoremap ' <C-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		" Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		" Escaping out of the string
		return "\<Right>"
	else
		" Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf

"""""""""""""""""""配置代码到此为止""""""""""""""""""""

" 快捷删除行末空白，展开tab，移除
function! Clean()
    exec 'retab'
    exec '%s/\s\+$//e'
    exec 'silent! %s/$//g'
endfunction
nmap <F9> :call Clean()<CR>


"""""""""""""""""NeoComplCache"""""""""""""""
" enable the NCC
let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_DisableAutoComplete = 1
" use smartcase
let g:neocomplcache_enable_smart_case = 1
" use camel case completion
let g:neocomplcache_enable_camel_case_completion = 1
" use underbar completion
let g:neocomplcache_enable_underbar_completion = 1
" set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" AutoComplPop like behavior
let g:neocomplcache_enable_auto_select = 0

" when you input 'ho-a', ncc will select candidate 'a'
let g:neocomplcache_enable_quick_match = 1

" define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions',
	\ 'css' : $VIMFILES.'/dict/css.dic',
	\ 'php' : $VIMFILES.'/dict/php.dic',
	\ 'javascript' : $VIMFILES.'/dict/javascript.dic'
	\ }
let g:neocomplcache_snippets_dir=$VIMFILES."/snippets"

inoremap <expr><space> pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

""""""""""""""81 notice""""""""""""
" :set colorcolumn=81
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v./

""""""""""""""vundle""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle "scrooloose/nerdtree"
Bundle "snipMate"
Bundle "Shougo/neocomplcache"
Bundle "uguu-org/vim-matrix-screensaver"

Bundle "scrooloose/nerdcommenter"

" 行选择,然后:Tabularize/=则把所选行的=全部对齐
Bundle "godlygeek/tabular"

Bundle "vim-scripts/taglist.vim"
Bundle "Lokaltog/powerline"

Bundle "terryma/vim-smooth-scroll"
Bundle "terryma/vim-multiple-cursors"

"Bundle "larrupingpig/vimgdb-for-vim7.3"

filetype plugin indent on     " required!





" Highlighting all the same string according to current selection
vnoremap <S-F8> :call VisualSelection('f')<CR>

" When you press <leader>r you can search and replace the selected text
" append /g to the end to replace all
vmap <leader>r :call VisualSelection('replace')<CR>

" When you press gv you vimgrep after the selected text
vmap <leader>gv :call VisualSelection('gv')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    elseif a:direction == '?'
        call CmdLine("!sdcv " . l:pattern)
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



""""""""""""""""scroll-smomth""""""""""""""
:map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>




""""""""""""""myself""""""""""""""""
:map <S-F5> /<C-R>=expand("<cword>")<CR>




""""""""""""""VimGdb""""""""""""""""""
":set previewheight=12
":run macros/gdb_mappings.vim
":set asm=0
":set gdbprg=/usr/bin/gdb
":map <F7> :bel 30vsplit gdb-variables<cr>
":map <F8> :close<Esc>
"map <c-w><c-f> :FirstExplorerWindow<cr>
"map <c-w><c-b> :BottomExplorerWindow<cr>
"map <c-w><c-t> :WMToggle<cr>
"let g:winManagerWindowLayout='FileExplorer|TagList'
":map <F6> :WMToggle<cr>
