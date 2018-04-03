filetype off
set shell=/bin/bash

call plug#begin()

" NMB plugins
Plug 'altercation/vim-colors-solarized'
set t_Co=16 
let g:solarized_termcolors=16 
colorscheme solarized
set background=dark
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

Plug 'tpope/vim-markdown'
Plug 'lervag/vimtex'
Plug 'fholgado/minibufexpl.vim'

Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'Lokaltog/vim-easymotion'
" Plug 'davidhalter/jedi-vim'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

Plug 'ivanov/vim-ipython'

Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plug 'mindriot101/vim-yapf'

call plug#end()

let mapleader = ","

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

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
autocmd FileType tex set tabstop=2 shiftwidth=2

nnoremap <leader>y :Yapf<cr>

" YouCompleteMe
let g:ycm_filetype_whitelist = {
      \ 'python' : 1,
      \ 'cpp' : 1,
      \}
set signcolumn=yes

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

" CODULUS: Set up formatting to be consistent with our style guide
autocmd BufRead,BufNewFile *.cc,*.h,*.c,*.sh,*.js,*.css set shiftwidth=2 tabstop=2 softtabstop=2 expandtab cindent cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

" Highlight any tabs anywhere
highlight EekATab ctermbg=red guibg=red
match EekATab /\t/
