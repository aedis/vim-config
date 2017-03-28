set cindent
set ts=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set showcmd
set ruler
set showmatch
set history=50
set autoindent
set nowrap
set cul
set nu
syntax on

nmap <F1> <ESC>:NERDTreeFind<CR>

nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>li

nmap s :mksession! .vimsession<CR>

nmap <F3> <ESC>:NERDTreeToggle<CR>

map <F5> <ESC>:tabnew<CR>
map <F6> <ESC>:tabprev<CR>
map <F7> <ESC>:tabnext<CR>
map <F8> <ESC>:tabclose<CR>

imap <F5> <ESC>:tabnew<CR>
imap <F6> <ESC>:tabprev<CR>i
imap <F7> <ESC>:tabnext<CR>i
imap <F8> <ESC>:tabclose<CR>i

nmap <F9> <ESC>:TagbarOpenAutoClose<CR>
nmap <F10> <ESC>:TlistToggle<CR>

nmap <F11> <ESC>:only<CR>

" augroup filetype
"   au! BufRead,BufNewFile *.proto setfiletype proto
" augroup end

set backspace=2
set backspace=indent,eol,start

"for removing tailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"for vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugin manager
Plugin 'gmarik/Vundle.vim'
" rst files
Plugin 'Rykka/riv.vim'
Plugin 'Rykka/InstantRst'
" git wrapper
Plugin 'tpope/vim-fugitive'
" all about "surroundings"
Plugin 'tpope/vim-surround'
" vim for erl
Plugin 'jimenezrick/vimerl'
" motions for erlang files (jumps between functions, heads...)
Plugin 'edkolev/erlang-motions.vim'
" completer for c/python
" additional system deps: python-jedi
Plugin 'Valloric/YouCompleteMe'
" file browser
Plugin 'wycats/nerdtree'
" buffers explorer
Plugin 'jlanzarotta/bufexplorer'
" syntax checking plugin
Plugin 'scrooloose/syntastic'
" window with tags list
Plugin 'majutsushi/tagbar'
" laternative (for c: jumps from header to source and vice versa)
Plugin 'a.vim'
" Simplify doxygen support for c/c++/python
Plugin 'DoxygenToolkit.vim'
Plugin 'brookhong/cscope.vim'
" vim syntax highlighting for protobufs files
Plugin 'uarun/vim-protobuf'
" status bar
Plugin 'bling/vim-airline'
" awsome live file explorer
Plugin 'kien/ctrlp.vim'
" text filtering and alignment
Plugin 'godlygeek/tabular'
" for commenting stuff
Plugin 'scrooloose/nerdcommenter'
" easily toggler for quickfix list and another
Plugin 'milkypostman/vim-togglelist'
" support for grep in Vim
Plugin 'grep.vim'
" smooth scroll
Plugin 'terryma/vim-smooth-scroll'
" signs for diffs in code in the left column
Plugin 'airblade/vim-gitgutter'
" ascii paint lead(ti/ts)
Plugin 'DrawIt'
" orgmonde for vim and speeddating, calendar
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'mattn/calendar-vim'

" for undo tree
Plugin 'sjl/gundo.vim'

" arduino
Plugin 'sudar/vim-arduino-syntax'
Plugin 'jplaut/vim-arduino-ino'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'

" CSS
Plugin 'hail2u/vim-css3-syntax'

" HTML5
Plugin 'othree/html5.vim'

" Sync
Plugin 'eshion/vim-sync'

" Autoformater
" additional system dep: python-autopep8, clang-format, astyle_c
Plugin 'Chiel92/vim-autoformat'

" Template
Plugin 'aperezdc/vim-template'

" previm
Plugin 'kannokanno/previm'

" open browser
Plugin 'tyru/open-browser.vim'

" quilt
Plugin 'vim-scripts/quilt'

call vundle#end()
filetype plugin indent on     " required!
"end for vundle

"for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['python', 'erlang'], 'passive_filetypes': ['c', 'cpp', 'puppet'] }
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 3
let g:syntastic_check_on_wq = 0

"for doxygen
let g:load_doxygen_syntax=1

"for CTRLP.VIM
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|log|beam|dump|o)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
" stay in dir from where vim has been started
let g:ctrlp_working_path_mode = ''

"for airline
set laststatus=2

"for buffer explorer
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file
                                       " name.
                                       "
" for vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" for NERDTree fitlering
let NERDTreeIgnore = ['\.pyc$', '\.o$']

"for spell checker
set spelllang=en_gb
"auto line break
set tw=100

map <F4> :set spell!<CR>

" Fix the difficult-to-read default setting for diff text highlighting.  The
" " bang (!) is required since we are overwriting the DiffText setting. The
" highlighting
" " for "Todo" also looks nice (yellow) if you don't like the "MatchParen"
" colors.
highlight! link DiffText MatchParen

" fir riv.rst
let g:riv_fold_level=0
let g:riv_disable_folding=0
let g:riv_fold_auto_update=0


" instantRST static dir
let g:instant_rst_static='~/.rst/static'

" orgmode agedna dir:
let g:org_agenda_files = ['~/org/*/*.org', '~/work/*/org/*.org']

" gundle config
nnoremap <F12> :GundoToggle<CR>

let g:gitgutter_max_signs = 5000

" for cscope
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" turn off update message
let g:cscope_silent = 1

" for tag bar
nmap <F9> :TagbarOpenAutoClose<CR>

" autoformater
let g:formatdef_clangformat = "'clang-format -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=\"{BasedOnStyle: Google, AllowShortLoopsOnASingleLine: true, BreakBeforeBraces: Allman, AlignTrailingComments: true, '.(&textwidth ? 'ColumnLimit: '.&textwidth.', ' : '').(&expandtab ? 'UseTab: Never, IndentWidth: '.&shiftwidth : 'UseTab: Always').'}\"'"
let g:formatters_c = ['clangformat', 'astyle_c']

" vim-template
let g:username = $FULL_NAME
let g:email = $EMAIL
let g:templates_directory = ['/home/'.$USER.'/work/vim-templates']

" for PreVim
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" for YCM
let g:ycm_global_ycm_extra_conf = '/home/'.$USER.'/work/vim-config/.ycm_extra_conf.py'
