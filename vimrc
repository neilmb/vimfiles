filetype off
set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" required
Plugin 'gmarik/vundle'

" NMB plugins
Plugin 'wincent/Command-T.git'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
set t_Co=16 
let g:solarized_termcolors=16 
colorscheme solarized
set background=dark
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1

Plugin 'tpope/vim-markdown'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'davidhalter/jedi-vim'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'

syntax on
filetype on
filetype plugin indent on

" Save the shift key!
nnoremap ; :

let mapleader = "'"

" Quickly switch buffers
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>

" FFS copy and paste
nmap <C-V> "+gP
vmap <C-C> "+v

" FFS save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-\><C-O>:update<CR> 

" Q to re-wrap paragraphs
vmap Q gq
nmap Q gqap

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" More configuration
set nowrap        " don't wrap lines
set hidden
set mouse=a
set spell spelllang=en_us
set ruler
set cursorline
set backspace=indent,eol,start
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,

set tw=78
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting

set modeline

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab

set cmdheight=1
set laststatus=2
set showcmd
set showmode
set number

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set laststatus=2
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set wildmode=longest,list,full
set wildmenu 


"
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%h%m%r%w                     " flags
set statusline+=%f\                          " file name
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=[0x%B]\                   " current char
set statusline+=%-14.(%c,%l%V/%L%)\ %<%P        " offset" 

"""
filetype plugin on
let g:tex_flavor='xelatex'
let g:Tex_DefaultTargetFormat = 'pdf'  
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
if has("gui_macvim")
  let g:Tex_ViewRule_pdf = 'open -a Preview'
else
  let g:Tex_ViewRule_pdf = 'okular --unique'
endif 

"""
let g:NERDCreateDefaultMappings = 0
map <Leader>c<Space> NERDCommenterToggle

"""
autocmd FileType tex set tabstop=2 shiftwidth=2

" Go highlighting
filetype off
filetype plugin indent off
set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

" YouCompleteMe
let g:ycm_filetype_whitelist = {
      \ 'python' : 1,
      \ 'cpp' : 1,
      \}

let g:rbpt_max = 16

let g:rbpt_colorpairs = [ [ 'red',     'red1'     ],
                        \ [ 'yellow',  'yellow1'  ],
                        \ [ 'green',   'green1'   ],
                        \ [ 'blue',    'blue1'    ],
                        \ [ 'cyan',    'cyan1'    ],
                        \ [ 'magenta', 'magenta1' ],
                        \ [ 'red',     'red2'     ],
                        \ [ 'yellow',  'yellow2'  ],
                        \ [ 'green',   'green2'   ],
                        \ [ 'blue',    'blue2'    ],
                        \ [ 'cyan',    'cyan2'    ],
                        \ [ 'magenta', 'magenta2' ] ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:gitgutter_sign_column_always = 1

autocmd FileType * setlocal colorcolumn=0

autocmd FileType c          setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=119
autocmd FileType cpp        setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=119
autocmd FileType java       setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=119
autocmd FileType lua        setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType python     setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=119
autocmd FileType yaml       setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType html       setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType css        setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType ruby       setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType erb        setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType eruby      setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119
autocmd FileType html.eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=119

autocmd FileType * IndentGuidesEnable
