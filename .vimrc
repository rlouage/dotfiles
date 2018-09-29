" packages
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'yinflying/matlab.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
call plug#end()

" extra plugin settings
packadd! matchit

" vim-slime
let g:slime_target = "tmux"

" some additional changes that make my life easier
set number
set rnu
set tabstop=4
set belloff=all
set so=5
set colorcolumn=120
set tabstop=4
set expandtab
set shiftwidth=4
set showcmd
set ruler
set foldmethod=syntax
set smartindent

" search settings
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" filetype settings
filetype plugin on
filetype indent on

" remappings
let mapleader=","

" colorsettings
colorscheme elflord

" autocomplete
set omnifunc=syntaxcomplete#Complete

" Navigating with guides
nnoremap <C-f> /<++><Enter>"_ca<
inoremap <C-f> <Esc>/<++><Enter>"_ca<
vnoremap <C-f> <Esc>/<++><Enter>"_ca<

""" latex stuff """
    " latex preview configuration 
    " Start autocompiling when the command :AutoCompile is issued
        let g:livepreview_previewer = 'okular'
        set updatetime=1000 
        command! AutoCompile LLPStartPreview
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
        autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
        autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
        autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
        autocmd FileType tex inoremap ,tt \texttt{} <++><Esc>T{i
        autocmd FileType tex inoremap ,ra (\ref{})<++><Esc>F}i
        autocmd FileType tex inoremap ,fig \begin{figure}<Enter>\centering<Enter>\includegraphics[width=0.5\textwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>4kf{a
        " the next command requires 2 packages: graphicx and subcaption
        autocmd FileType tex inoremap ,sfig2 \begin{figure}<Enter>\centering<Enter>\begin{subfigure}[b]{0.5\textwidth}<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>~ %add desired spacing between images, e. g. ~, \quad, \qquad, \hfill etc.<Enter>\begin{subfigure}[b]{0.5\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>\caption{<++>}\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>12kf{a
        autocmd FileType tex inoremap ,sfig3 \begin{figure}<Enter>\centering<Enter>\begin{subfigure}[b]{0.3\textwidth}<Enter>\includegraphics[width=\textwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>~ %add desired spacing between images, e. g. ~, \quad, \qquad, \hfill etc.<Enter>\begin{subfigure}[b]{0.3\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>\begin{subfigure}[b]{0.3\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{subfigure}<Enter>\caption{<++>}\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>17kf{a
        autocmd FileType tex inoremap ,eq \begin{equation}<Enter><Enter>\label{eqn:<++>}<Enter>\end{equation}<Enter><++><Esc>3k^i<Tab>
        autocmd FileType tex inoremap ,eq* \begin{equation*}<Enter><Enter>\end{equation*}<Enter><++><Esc>2k^i<Tab>
        autocmd FileType tex inoremap ,al \begin{align}<Enter><Enter>\label{eqn:<++>}<Enter>\end{align}<Enter><++><Esc>3k^i<Tab>
        autocmd FileType tex inoremap ,al* \begin{align*}<Enter><Enter>\end{align*}<Enter><++><Esc>2k^i<Tab>
        autocmd FileType tex inoremap ,frac \frac{}{<++>}<Esc>^f{a
