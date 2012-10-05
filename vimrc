filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
filetype on
filetype plugin indent on

" Save the shift key!
nnoremap ; :

" FFS copy and paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>a 
vmap <C-C> "+v

" FFS save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR> 

" Q to re-wrap paragraphs
vmap Q gq
nmap Q gqap

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" More configuration
set nowrap        " don't wrap lines
set hidden
set spell spelllang=en_us
set ruler
set backspace=indent,eol,start
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,

set tw=78
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab

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

"""
filetype plugin on
let g:tex_flavor='xelatex'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'okular --unique'
