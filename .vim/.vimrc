set shell=bash
set nocompatible               " be iMproved
filetype off                   " required!

set termguicolors

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" plugin for browsing the tags of source code files
Plugin 'majutsushi/tagbar'

" color scheme
Plugin 'altercation/vim-colors-solarized'

" provides mappings to easily delete, change and add such surroundings in pairs
Plugin 'tpope/vim-surround'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'

" file browser within Vim/gVim
Plugin 'scrooloose/nerdtree'

" syntax checking plugin for Vim
Plugin 'scrooloose/syntastic'

" => can omit the username part
" Vim-script library, which provides some utility functions and commands for programming in Vim
Plugin 'L9'

" provides convenient ways to quickly reach the buffer/file/command/bookmark/tag you want
Plugin 'FuzzyFinder'

" Shows "At match #N out of M matches" on (/,?,n,N,*,#)
Plugin 'IndexedSearch'

" Perl Support
Plugin 'perl-support.vim'

" Github repos of the user 'vim-scripts'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'
" ...

" vim airline
Plugin 'bling/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'

" csv plugin
Plugin 'chrisbra/csv.vim'

call vundle#end()            " required

filetype plugin indent on     " required!

" #############################################################
" Colors and Fonts
" #############################################################
" Enable syntax highlighting
syntax enable
set bg=light

" Fonts
"set gfn=Envy\ Code\ R\ 10
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
"set gfn=ShureTechMono\ Nerd\ Font\ Mono\ 10
set gfw=

" In the molokai theme, attempts to bring the 256 color version as close as possible to the the default (dark) GUI version 
let g:rehash256 = 1
set t_Co=256
colorscheme solarized
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%t\ %M
    set background=light
else
    set background=dark
endif


" Use Unix as the standard file type
set ffs=unix,dos,mac


" Configs for Solarized
"syntax on
"set background=light
"let g:solarized_termcolors=256
"let g:rehash256 = 1
"colorscheme solarized

if &diff
  set background=dark
"    colorscheme morning
    highlight DiffAdd cterm=NONE ctermfg=bg ctermbg=Green gui=NONE guifg=bg guibg=Green
    highlight DiffDelete cterm=NONE ctermfg=bg ctermbg=Red gui=NONE guifg=bg guibg=Red
    highlight DiffChange cterm=NONE ctermfg=bg ctermbg=Yellow gui=NONE guifg=bg guibg=Yellow
    highlight DiffText cterm=NONE ctermfg=bg ctermbg=Magenta gui=NONE guifg=bg guibg=Magenta
endif    

" Highlights current line
set cursorline

" Highlights all search pattern
set hlsearch

" Shows relative number for all lines but current one
set relativenumber
set number

" ##############################################
" Status bar settings
" ##############################################
" vim-airline, show status bar as a persistent fixture
set laststatus=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Configure status bar
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '»'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '«'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = ''

" Configs for vim-airline
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
" Allow powerline fonts
"let g:airline_powerline_fonts = 1

" Install ruler on screen bottom
set ruler

" Creates undo file
set undofile

" Controls tab and shift behavior
set tabstop=3 shiftwidth=3 softtabstop=3 expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype perl   setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype yaml   setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype yml    setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3

" Avoids line wrap
set nowrap

" Auto indent
set autoindent

" Incremental search
set incsearch

" Ignores white space during diff
set diffopt+=iwhite

set ttyfast lazyredraw
" Disable background color eraser
set t_ut=

au BufNewFile,BufRead *.sv setlocal ft=verilog
au BufNewFile,BufRead *.vh setlocal ft=verilog
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugin/YAML.vim

"set diffexpr=MyDiff()
function MyDiff()
    let opt = ""
    if exists("g:diffignore") && g:diffignore != ""
        let opt = "-I " . g:diffignore
    endif
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-w "
    endif
    silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction

:nmap n nzz
:nmap N Nzz
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap <C-j> <Esc>/[)}"'\]>]<CR>a
:imap _* <Esc>bi*<Esc>ea*<Space>
