set nocompatible
filetype off


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=/home/areobe/.vim/bundle/Vundle.vim
call vundle#begin()

" colorschemes
Plugin 'flazz/vim-colorschemes'

"syntax highlighting
Plugin 'yinflying/matlab.vim'
Plugin 'pangloss/vim-javascript'

" plugins for making vim a IDE like editor
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jpalardy/vim-slime'

" Autocompletion 
Plugin 'Valloric/YouCompleteMe'

" Latex 
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call vundle#end()            " required
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PlUGINS SETTINGS "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" slime 
let g:slime_target = "tmux"

" javascript syntax
let g:javascript_plugin_jsdoc = 1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set 5 lines to the cursor - when moving vertically using j/k
set so=5

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching or indenting try to be smart about it 
set smartcase
set smartindent

" Highlight search results
set hlsearch

" remove highlighting when pressing space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" navigation with guides
nnoremap <C-f> /<++><Enter>"_ca<
inoremap <C-f> <Esc>/<++><Enter>"_ca<
vnoremap <C-f> <Esc>/<++><Enter>"_ca<

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" display relative numbers on the left 
set number
set rnu

" display a line at 120 characters
set colorcolumn=120

" fold based on syntax
set foldmethod=syntax

" show commands 
set showcmd

" don't join spaces and wrap lines
set nojoinspaces
set wrap!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fast save
nnoremap <C-w> :w<Enter>
inoremap <C-w> <Esc>:w<Enter>

" fast paste
inoremap <C-p> <C-r>+

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHEMES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme elflord
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 120 characters
set lbr
set tw=120

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\      "file name 
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  "file encoding
set statusline+=%{&ff}]                          "file format
set statusline+=\ %y                             "filetype
set statusline+=\ CWD:\ %r%{getcwd()}%h\ \       "current working directory 
set statusline+=Line:\ %l\ \                     "line number 
set statusline+=Column:\ %c                      "column number 
set statusline+=%=\ Buf:%n                       "buffer number
set statusline+=\ [%b][0x%B]\                    "ASCII and byte code under cursor

" color of the status line
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LATEX PLUGIN 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start autocompiling when the command :LLPStartPreview is issued
command! AutoCompile LLPStartPreview
let g:livepreview_previewer = 'evince'

" set the autoupdate time to 1 sec
set updatetime=1000

" let empty tex files also be tex files
let g:tex_flavor='latex'

" Code snippets
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item
autocmd FileType tex inoremap ,li <Enter>\item
autocmd FileType tex inoremap ,ref \ref{} <++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,a \href{}{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{} <++><Esc>T{i
autocmd FileType tex inoremap ,ra (\ref{})<++><Esc>F}i
autocmd FileType tex inoremap ,fig \begin{figure}<Enter>\centering<Enter>\includegraphics[width=0.5\textwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>4kf{a
autocmd FileType tex inoremap ,sfig2 \begin{figure}<Enter>\centering<Enter>\begin{subfigure}[b]{0.5\textwidth}<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>~ %add desired spacing between images, e. g. ~, \quad, \qquad, \hfill etc.<Enter>\begin{subfigure}[b]{0.5\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>\caption{<++>}\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>12kf{a
autocmd FileType tex inoremap ,sfig3 \begin{figure}<Enter>\centering<Enter>\begin{subfigure}[b]{0.3\textwidth}<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>~ %add desired spacing between images, e. g. ~, \quad, \qquad, \hfill etc.<Enter>\begin{subfigure}[b]{0.3\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>\begin{subfigure}[b]{0.3\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>\caption{<++>}\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>17kf{a
autocmd FileType tex inoremap ,eq \begin{equation}<Enter><Enter>\label{eqn:<++>}<Enter>\end{equation}<Enter><++><Esc>3k^i<Tab>
autocmd FileType tex inoremap ,eq* \begin{equation*}<Enter><Enter>\end{equation*}<Enter><++><Esc>2k^i<Tab>
autocmd FileType tex inoremap ,al \begin{align}<Enter><Enter>\label{eqn:<++>}<Enter>\end{align}<Enter><++><Esc>3k^i<Tab>
autocmd FileType tex inoremap ,al* \begin{align*}<Enter><Enter>\end{align*}<Enter><++><Esc>2k^i<Tab>
autocmd FileType tex inoremap ,frac \frac{}{<++>}<Esc>^f{a
