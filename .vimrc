set number
set nocompatible
set backspace=2
set autoindent
set modifiable
set foldmethod=syntax
set foldlevel=99
syntax on

" TagList
let tlistOpened = 1
map <f9> :TlistOpen<CR>
autocmd BufWinEnter * TlistToggle
"autocmd VimEnter * TlistOpen
"autocmd VimEnter * TlistOpen
let Tlist_File_Fold_Auto_Close=1
"let Tlist_WinWidth = 25
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Inc_Winwidth=0

map <f4> :q<CR>
map <f5> :e<CR>
map <f7> :q<CR>:q<CR>:q<CR>

set tags=./tags;
autocmd BufWritePre * :%s/\s\+$//e

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
"set noexpandtab
else
"set expandtab
set tabstop=4
set shiftwidth=4
endif

" focus current line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" split navigation
map <C-k> <C-W>j
map <C-i> <C-W>k
map <C-j> <C-W>h
map <C-l> <C-W>l

:set background=dark
"show file path
map f :echo @%<CR>
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

" cscope "
cs add cscope.out
"map f :cs find f
"map c :cs find c
"map s :cs find s
"nmap <C-h> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-v> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-i> :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\> :cs reset<CR>
" nnoremap <C-]> :tabnew %<CR>g<C-]>

" NerdTree
autocmd BufWinEnter * NERDTreeMirror
au VimEnter *  NERDTree
autocmd VimEnter * NERDTree | wincmd p
nnoremap <silent> <F6> :NERDTree<CR>
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=25

nnoremap 1 1gt
nnoremap 2 2gt
nnoremap 3 3gt
nnoremap 4 4gt
nnoremap 5 5gt
nnoremap 6 6gt
nnoremap 7 7gt
nnoremap 8 8gt
nnoremap 9 9gt
"nnoremap 10 10gt

map r :1,$s///g
map <f2> :w \| make


if v:version >= 600
  filetype plugin on
  filetype indent on
else
  filetype on
endif

if v:version >= 700
  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
  let OmniCpp_GlobalScopeSearch   = 1
  let OmniCpp_DisplayMode         = 1
  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
  let OmniCpp_ShowAccess          = 1 "show access in pop-up
  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
  let OmniCpp_NamespaceSearch     = 2
  let OmniCpp_ShowPrototypeInAbbr = 1
  set completeopt=menuone,menu,longest
endif
" End /etc/vimrc

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction


nnoremap \ :! ./build_cscope && ./build_ctags % <CR>
nnoremap m :so ~/.vimrc<CR>

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

