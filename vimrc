" Author: Johannes Lahann
" Setup {{{1
set nocompatible
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tsaleh/vim-matchit'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neosnippet'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'mileszs/ack.vim'
" Bundle 'pangloss/vim-javascript'
" Bundle 'godlygeek/tabular'
" Bundle 'tpope/vim-sleuth'
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-haml'

" Colorschemes
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-scripts/mayansmoke'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'

filetype plugin indent on
syntax on
set background=dark
colorscheme badwolf
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Navigation {{{1
" Easymotion {{{2
let g:EasyMotion_mapping_f = ',f'
let g:EasyMotion_mapping_F = ',F'
let g:EasyMotion_mapping_w = ',w'
let g:EasyMotion_mapping_b = ',b'
" split {{{2
nnoremap <leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
"  CtrlP {{{2
nnoremap <Leader>o :CtrlPCurWD<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>B :CtrlPBuffer<CR>
nnoremap <Leader>u :CtrlPUndo<CR>
" Basics {{{1
let mapleader = ","
let maplocalleader = "#"
set hidden
set number
set shell=/bin/bash
set lazyredraw
set cursorline
set encoding=utf-8
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set fillchars=diff:⣿,vert:│
set showmode
set wildmenu
set autoread
set backspace=2 "make backspace work like in other apps
set ignorecase
set incsearch
set list
set omnifunc=syntaxcomplete#Complete
set shiftwidth=4
set expandtab
set wildmode=list:longest,list:full
set showcmd
set smartcase
set autoindent
set smartindent
set laststatus=2
set spelllang=eng
set tabstop=4
set timeoutlen=600
set ttyfast
set wrapmargin=0
set clipboard=unnamedplus
set linebreak
set display=lastline
" Backups {{{1
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.
set history=1000
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
" Gui {{{1
if has("gui_running")
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=m
	set guioptions-=l
	set guioptions-=L
	set guioptions=%t
endif
highlight SpellBad term=underline gui=undercurl guisp=Orange

" Different cursors for different modes.
set guicursor=n-c:block-Cursor-blinkon0
set guicursor+=v:block-vCursor-blinkon0
set guicursor+=i-ci:ver20-iCursor


" Mappings {{{1
 "  Learnings {{{2
"
"  Ack {{{2

nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" }}}
" Latex{{{2
map <LocalLeader>v :LatexView<CR>
" Moving arround {{{2

nmap <silent> <leader>ev :vnew $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
" Useful stuff {{{2
nmap  <leader>p :set invpaste:set paste?
nmap  <leader>n :set invhls:set hls?
nmap  <leader>w :set invwrap:set wrap?
nmap  <leader>rr :1,$retab
nmap  <leader>cd :lcd %:h
nmap  <leader>md :!mkdir -p %:p:h

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_


" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Uppercase word
inoremap <C-u> <esc>mzgUiw`za

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Reformat line.  I never use l as a macro register anyway.
nnoremap ql gqq

" Easier linewise reselection
nnoremap <leader>V V`]

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>



" Folding {{{2
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO



" Plugins {{{1
" neosnippet {{{2
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" neocomplecache {{{2
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" AutoComplPop like behavior.
" let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" CtrlP {{
" latex- box {{{2
let g:LatexBox_viewer = 'evince'
let g:LatexBox_latexmk_options = '-pvc -pdf'
let g:LatexBox_output_type="pdf"
let g:tex_flavor = "latex"
let g:LatexBox_no_mappings='true'



" Fugitive {{{2

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" "Hub"
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>

" }}}
" Surround.vim {{{2
" let g:surround_42 = "**\r**"
" nnoremap ** :exe "norm v$hS*"<cr>
" nnoremap __ :exe "norm v$hS_"<cr>
" vmap * S*
" vmap _ S_
" tComment {{{2
let g:tcommentGuessFileType_markdown = 'html'

" Autocommands {{{1
" markdown {{{2
augroup markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
augroup END

" java {{{2
augroup java
    autocmd!
    autocmd FileType java setlocal foldmethod=marker
    autocmd FileType java setlocal foldmarker={,}
augroup END
" javascript {{{2
" augroup javascript
"     autocmd!
"     autocmd FileType javascript setlocal foldmethod=marker
"     autocmd FileType javascript setlocal foldmarker={,}
" augroup END
" css {{{2
augroup css
    autocmd!
    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    autocmd Filetype less,css setlocal foldmethod=marker
    autocmd Filetype less,css setlocal foldmarker={,}
augroup END
" java {{{2
augroup java
    autocmd!
    autocmd FileType java setlocal foldmethod=marker
    autocmd FileType java setlocal foldmarker={,}
augroup END
" latex {{{2
augroup latex
    autocmd!
    autocmd FileType tex setlocal foldmethod=marker
    autocmd FileType tex setlocal foldmarker={,}
augroup END

" c {{{2
augroup c
    autocmd!
    autocmd FileType java setlocal foldmethod=marker
    autocmd FileType java setlocal foldmarker={,}
augroup END
" html {{{2
augroup html
    autocmd!
    autocmd Filetype html setlocal foldmethod=inline
augroup END
" ruby {{{2
augroup ruby
    autocmd!
    autocmd FileType setlocal foldmethod=syntax
augroup END
" vim {{{2
augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType help setlocal textwidth=78
    autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" configFiles {{{2
augroup configFiles
    autocmd!
    autocmd BufRead,BufNew .bashrc setlocal foldmethod=marker
augroup END

" nonvim {{{2
augroup nonvim
   autocmd!
   autocmd BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) ."&" | bd | let &ft=&ft | redraw!
   " autocmd BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
   autocmd BufRead *.ppt*,*.doc*,*.rtf let g:output_pdf = shellescape(expand("%:r") . ".pdf")
   autocmd BufRead *.ppt*,*.doc*,*.rtf sil exe "!$HOME/.bin/pdf " . shellescape(expand("%:p"))
   autocmd BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . g:output_pdf | bd | let &ft=&ft | redraw!
augroup end
" Line Return {{{1
augroup line_return
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Pandoc and Notes {{{1
let g:module = system('echo -n "$MODULE"')

nnoremap -md :w!<cr>:exe "!pandoc --latex-engine=pdflatex  -o $HOME/Dropbox/Notes/pdf/" . fnameescape(expand('%:t:r')) . ".pdf " . fnameescape(expand('%:p'))<cr>
nnoremap -mp :w!<cr>:exe "!pandoc --latex-engine=pdflatex  -o /tmp/" . fnameescape(expand('%:t:r')) . ".pdf " . fnameescape(expand('%:p')) . " && xdg-open /tmp/" . fnameescape(expand('%:t:r')) . ".pdf"<cr>

