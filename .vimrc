set nocompatible              " be iMproved, required
    filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
if has("syntax")
	syntax on
endif
set autoindent
set cindent
set smartindent
set bs=2
"set tabstop=4
"set expandtab
"set shiftwidth=4
set mouse=a
set hlsearch
set splitright
set splitbelow
"set visualbell      "Lighting if press fault key

set wildmenu
set wildmode=list:longest

if &diff
    silent! colorscheme diffcolors
endif
"colorscheme jellybeans

" check os
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
        "let g:os = "Linux"
    endif
endif

if g:os == "Windows"
    let g:vimrc = "~/_vimrc"
else
    let g:vimrc = "~/.vimrc"
endif
        
" ==========================================
" Tabspace without Makefile
" ==========================================
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
endif

"if _curfile =~ ".*\.lib"
"    setfiletype plain
"endif
au! filetypedetect BufNewFile,BufRead *.lib

"Quick search(*)
xmap * <ESC>*
"nmap <C-F> *Nmf
nmap <C-F> :let lastcopy=@"<CR>viw"ty:let @/=@t<CR>:let @"=lastcopy<CR>:set hls<CR>mf
"nmap <C-F> g*
xmap <C-F> <ESC><C-F>
nmap g<C-F> `f

"Comment Toggle (NERD Commenter)
let g:NERDDefaultAlign = 'left'
map c <leader>c<space>

"Select All
"map <C-A> ggVG

" Shift + 방향키 설정
map  <S-Left> <C-Left><C-w>x
map  <S-Right> <C-w>x<C-W><C-P>
map  <S-Up> <C-Up><C-w>x
map  <S-Down> <C-w>x<C-W><C-P>

" Control + 방향키 설정(윈도우 이동)
map  <C-Left>   <ESC><C-w><Left>
map  <C-Right>  <ESC><C-w><Right>
map  <C-Up>     <ESC><C-w><Up>
map  <C-Down>   <ESC><C-w><Down>
nmap <C-h>      <C-Left>
nmap <C-l>      <C-Right>
nmap <C-k>      <C-Up>
nmap <C-j>      <C-Down>

" Control + Shift + 방향키 설정(윈도우 크기 변경)
map  <C-S-Left>   <ESC><C-Left>10<C-W><<C-W><C-P>
map  <C-S-Right>  <ESC>10<C-W>>
"map  <C-S-Left>   <ESC><C-Left>:vertical resize -10<CR><C-W><C-P>
"map  <C-S-Right>  <ESC>:vertical resize +10<CR>
map  <C-S-Up>     <ESC><C-Up>10<C-W>-<C-W><C-P>
map  <C-S-Down>   <ESC>10<C-W>+

"Insert Mode
imap jk <ESC>
imap kj <ESC>
"imap <C-H> <Left>
"imap <C-J> <Down>
"imap <C-K> <Up>
"imap <C-L> <Right>
"imap <C-W> <ESC>lwi
"imap <C-B> <ESC>bi
"imap <C-E> <ESC>ei
            
"Tab Indent
nnoremap >       >>
nnoremap <       <<
xnoremap >       >gv
xnoremap <       <gv
map      <Tab>   >
map      <S-Tab> <
imap     <S-Tab> <ESC><

"Delete this word and insert mode
nmap cw viwc

"<Home> means ^ not 0
map <Home> ^
imap <Home> <ESC>^i
map gh ^
map gl $

"g extension
"open file in new buffer
"map gnf :vs<CR>gf
noremap gdd md*gd
map gD `d
"map gndd :sp<CR>gdd
map gs :sp<CR>
map vs :vs<CR>

map g; ml:let lastsearch=@/<CR>?;<CR>:let @/=lastsearch<CR>
map g: `l

"bracket
xmap g( <ESC>`<i(<ESC>`>la)<ESC>gvll
xmap g{ <ESC>`<O{<ESC>`>o}<ESC>gv<Tab>

"Scroll up/down
noremap J <C-e>
noremap K <C-y>
map I <C-U>
map M <C-D>
noremap gj J

"mark position
"noremap ggg gg
noremap gk  mQ
"noremap ggk `Q
noremap gK  `Q

"Easymotion
map L <leader><leader>w
map H <leader><leader>b
nmap gw <Plug>(easymotion-overwin-w)

"Open Directory
"nmap <C-E> :Explore<CR>
nmap ge    :Explore<CR>
nmap <C-e> :NERDTreeFind<CR>
xmap <C-e> <ESC>:NERDTreeFind<CR>
"map <C-n> :vs<CR>:E<CR>
nmap <C-n> :Vexplore!<CR>=
xmap <C-n> <ESC>:Vexplore!<CR>=

"OpenVimrc
"nmap vim  :vs<CR>:e ~/.vimrc<CR>
"nmap vish :vs<CR>:e ~/.vimrc<CR>
"nmap sosh :so ~/.vimrc<CR>
nmap vim  :vs<CR>:execute "edit" g:vimrc<CR>
nmap vish vim
nmap sosh :execute "so" g:vimrc<CR>

"Quit / Save
nmap <Esc>q :q<CR>
xmap <Esc>q <ESC>:q<CR>
nmap <Esc>w :w<CR>
xmap <Esc>w <ESC>:w<CR>

 "Tab
"map <C-t> :tabnew<CR>:NERDTree<CR>
map <C-t> mT:tabnew<CR>`T
"map <C-F4> :tabclose<CR>
map O1;5S :tabclose<CR> 
noremap gr gT
nmap gTr :tabfir<CR>
nmap gTt :tabl<CR>
nmap gTj :-tabmove<CR>
nmap gTk :+tabmove<CR>
nmap gTh :0tabmove<CR>
nmap gTl :$tabmove<CR>
nmap gT :tabmove 

" Normal mode backspace/space/enter
nmap <Del> "_x
xmap <Del> "_x
nmap <backspace> h"_x
"nmap  h"_x
nmap <space> i <ESC>l
nmap <CR> o<ESC>

"Turn Off Highlight
map <F12>    :noh<CR>
map g<space> :noh<CR>
imap <F12>   <ESC><F12>i
xmap <F12>   <ESC><F12>gv

"Toggle wrap
nmap <C-F12> :set wrap! wrap?<CR>
xmap <C-F12> <ESC><C-F12>

"Macro
map  <F2> qm
map  <F3> q
imap <F3> <ESC>q
map  <F4> @m

"refresh
map  <F5>   :e!<CR>
map  <S-F5> :e!<CR>G

"copy & paste
nmap <F9>      viw<F9>
xmap <F9>      "+y
imap <F9>      <ESC>viw<F9>
nmap <F10>     viw<F10>
xmap <F10>     "+p
imap <F10>     <ESC>"+pli
nmap <C-F10>   "+p
imap <C-F10>   <ESC><C-F10>
nmap <C-S-F10> "+P

"Block visual insert
xmap C yPgvc

"declation align
nmap gd_maketempbus :'<,'>v/\v\[[^:]+:[^:]+\]\|^ *\/\//s/\v(input\|outputreg\|output\|inout\|wire\|reg)/\1 [x:x]<CR>
xmap gd_maketempbus <ESC>gd_maketempbus
nmap gd_align :'<,'>EasyAlign * /\v[\[:\];]\|(\/\/)/ v/\v^\/\//l2r1<CR>
xmap gd_align <ESC>gd_align
nmap gd_deltempbus :'<,'>s/\v\[( +)x( +):( +)x( +)\]/ \1 \2 \3 \4 /<CR>
xmap gd_deltempbus <ESC>gd_deltempbus
nmap gda :'<,'>s/output reg/outputreg<CR>gd_maketempbusgd_aligngd_deltempbus:'<,'>s/outputreg /output reg<CR>
xmap gda <ESC>gda
"instance align
nmap gia V/;<CR>k:EasyAlign */[.()]/l0r0<CR><F12>
"let g:easy_align_delimiters = {
"\ ']' : { 
"\         'pattern'         :'[[\]]'  , 
"\         'left_margin'     : '1'     ,
"\         'right_margin'    : '1'     ,
"\         'delimiter_align' : '0'     
"\       }
"\}

"command-line mode
"cmap <C-H> <Left>
"cmap <C-J> <Down>
"cmap <C-K> <Up>
"cmap <C-L> <Right>


"command -bar CInstAlign norm Vi(|EasyAlign */,/
"command CInstAlign2 norm Vi(<CR>:EasyAlign

"AirlineTheme zenburn
"AirlineTheme term
"let g:airline_theme='term'

"calculation
"xmap gc "cdi<C-R>=<C-R>c<CR><ESC>
xmap gc "cygvc<C-R>=<C-R>c<CR><ESC>
