set nocompatible

filetype plugin indent on

" VIM 8 plugins
packloadall

" Personal configuration
set sm                " search magic
set hls               " kleuren bij zoeken
set incsearch         " incremental search
set mouse=n				    " mouse deftig instellen
set pastetoggle=<F9>  " toggle tussen pastemode en niet-pastemode
set number            " regelnummers

" Colorcolumn
if exists('+colorcolumn')
	au BufEnter * set colorcolumn=
	au BufEnter *.{py,rb,erb,js,ts,jsx,tsx,md} set colorcolumn=100
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

" Syntax
syntax on

" How to show spaces and tabs in list mode
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:·

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
" toggle list mode
:map <F8> :set list!<CR>
:imap <F8> <ESC>:set list!<CR>a

" pdflatex ipv latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
"let g:Tex_ViewRule_pdf = 'kpdf'

" NERDTree
:map <Leader>n <plug>NERDTreeTabsToggle<CR>
:imap <Leader>n <ESC><plug>NERDTreeTabsToggle<CR>i

" make sure we can type the é
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

" For github flavored markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Add fzf installed using Homebrew to runtime path
set rtp+=/usr/share/doc/fzf/example
" Map C-P to :FZF
nmap <C-P> :FZF<CR>

" Source per directory settings
if filereadable(".vimrc.local")
  source .vimrc.local
endif
