set nocompatible
" VUNDLE - DO THIS FIRST
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My bundles
" Sensible defaults
" Also do: mkdir -p ~/.cache/vim/{swap,backup,undo}
Plugin 'tpope/vim-sensible'
" Latex
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
" A tree for navigating files
Plugin 'scrooloose/nerdtree'
" cscope
" Plugin 'steffanc/cscopemaps.vim'
" Support for github flavored markdown
Plugin 'jtratner/vim-flavored-markdown'
" Find files to open easily
Plugin 'kien/ctrlp.vim'
" Ctrl-p extension for use with tabs
Plugin 'DavidEGx/ctrlp-smarttabs'
" Some easy to use mappings
" Plugin 'tpope/vim-unimpaired'
" Switch between headers and implementation
" Plugin 'vim-scripts/a.vim'
" C code completion
" Plugin 'Rip-Rip/clang_complete'
Plugin 'djoshea/vim-autoread'
" Coffeescript syntax highlighting
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

" Personal configuration
set sm                " search magic
set hls               " kleuren bij zoeken
set incsearch         " incremental search
set tabstop=2         " 1 tab = 2 spaties
set textwidth=0       " lijnen niet afbreken
set noexpandtab       " vervang tabs niet door spaties
set mouse=n				    " mouse deftig instellen
set pastetoggle=<F9>  " toggle tussen pastemode en niet-pastemode
set number            " regelnummers
set fileformat=unix   " alleen LF op het einde van een regel

" Default settings
au BufEnter * set ts=2 noexpandtab ai

" Python
" PEP 8 says max. 79 chars on a line
au BufEnter *.{py,rb,erb,js} set ts=4 expandtab sw=4 cindent fileencoding=utf8

" Prolog, Demoen wil acht spaties of een tab
au BufEnter *.pl set ts=8 noexpandtab
" Haskell
au BufEnter *.hs set ts=8

" Instelling voor Gentoo ebuilds
au BufRead,BufNewFile *.e{build,class} let is_bash=1|setfiletype sh
au BufRead,BufNewFile *.e{build,class} set ts=4 sw=4 noexpandtab cindent

" Makefiles
au BufEnter *Makefile* set noexpandtab

" Lijnafbreking voor latex
au BufEnter *.tex set textwidth=80

" Markdown
au BufEnter *.md set ts=4 expandtab sw=4 cindent fileencoding=utf8

" YAML
au BufEnter *.{yaml,yml} set ts=2 expandtab sw=2 cindent fileencoding=utf8

" Coffee
au BufEnter *.coffee set ts=2 expandtab sw=2 cindent fileencoding=utf8

" HAML
au BufEnter *.haml set ts=2 expandtab sw=2 cindent fileencoding=utf8

" Colorcolumn
if exists('+colorcolumn')
	au BufEnter * set colorcolumn=
	au BufEnter *.{py,rb,erb,js} set colorcolumn=80
endif

" Indentatie
set nocp incsearch
set cinoptions=ls,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set shiftwidth=2

" Huidige paragraaf herordenen volgens de huidige 'textwidth'
nmap <C-T> gqap
vmap <C-T> gq
imap <C-T> <C-O>gqap

" Kleuren
set background=light
" colo evening

" Syntax
syntax on


" LATEX PLUGIN
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" Remap TAB to keyword completion
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    elseif "forward" == a:direction
        return "\<c-n>"
    else
        return "\<c-x>\<c-k>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
inoremap <c-tab> <c-r>=InsertTabWrapper ("startkey")<cr>


" toggle tab completion
function! ToggleTabCompletion()
    if mapcheck("\<tab>", "i") != ""
        :iunmap <tab>
        :iunmap <s-tab>
        :iunmap <c-tab>
        echo "tab completion off"
    else
        :imap <tab> <c-n>
        :imap <s-tab> <c-p>
        :imap <c-tab> <c-x><c-l>
        echo "tab completion on"
    endif
endfunction

" map <Leader>tc :call ToggleTabCompletion()<cr>
map tc :call ToggleTabCompletion()<cr>
:map <F7> :call ToggleTabCompletion()<CR>
:imap <F7> <ESC>:call ToggleTabCompletion()<CR>i

" tell complete to look in the dictionary
set complete-=k complete+=k

" load the dictionary according to syntax
:au BufReadPost * if exists("b:current_syntax")
:au BufReadPost *   let &dictionary = substitute("/usr/share/vim/vimfiles/dict/FT.dict", "FT", b:current_syntax, "")
:au BufReadPost * endif 

" Keyboard shortcuts
" make uitvoeren
:map <F10> :w<CR>:set makeprg=make<CR>:make<CR><CR>
:imap <F10> <ESC>:w<CR>:set makeprg=make<CR>:make<CR><CR>i
" dvi tonen van huidige file (bij LaTeX)
:map <F11> :w<CR>\lv<CR>
:imap <F11> <ESC>:w<CR>\lv<CR>i
" 2 maal latex op de huidige file 
:map <F12> :w<CR>\ll<CR>\ll<CR>
:imap <F12> <ESC>:w<CR>\ll<CR>\ll<CR>i
" folding refreshen
:map <F6> :w<CR>\rf<CR>
:imap <F6> <ESC>:w<CR>\rf<CR>i
" circuleren tussen buffers
:map <F3> :w<CR>:tabp<CR>
:imap <F3> <ESC>:w<CR>:tabp<CR>i
:map <F4> :w<CR>:tabn<CR>
:imap <F4> <ESC>:w<CR>:tabn<CR>i
:map <F5> :CtrlPSmartTabs<CR>
:imap <F5> <ESC>:w<CR>:CtrlPSmartTabs<CR>
" commando uitvoeren
:map <F2> :!
:imap <F2> <ESC>:!
" Huidige file uitvoeren
" :nnoremap <F10> :!%:p<CR>
" :inoremap <F10> <ESC>:!%:p<CR>i

" pdflatex ipv latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'kpdf'

" make sure we can type the é
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

" For github flavored markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" crtl-p configuration
" open files in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" Source per directory settings
if filereadable(".vimrc.local")
  source .vimrc.local
endif
