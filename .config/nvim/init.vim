" co1ncidence's init.vim

" UI based settings

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"      " allows termguicolors to work


let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
syntax on
colorscheme wonka-dark
set ruler
set number relativenumber
set laststatus=2
set noshowmode

" rebinding vim split navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural vim splitting

set splitbelow
set splitright

" lightline colorscheme

let g:lightline = {}
let g:lightline.colorscheme = 'darcula'

" indendation settings

set tabstop=4       " number of visual spaces per TAB
:set shiftwidth=4   " sets indendation spaces
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" bottom bar settings

set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files

" folding settings

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" misc settings

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set scrolloff=3
set autoread
let g:netrw_winsize = 25

" search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          
set t_Co=256
let g:rehash256 = 1
set cursorline
set title

" undo, shell, backspace, and mouse settings

set history=1000
set shell:bash
set backspace=indent,eol,start
set mouse=a

" autocmd's

autocmd InsertEnter * norm zz              " centers screen upon entering insert mode
autocmd BufWritePre *.py :%s/\s\+$//e      " removes whitespaces automatically on file save

" vim-plugins

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'nightsense/wonka'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'thaerkh/vim-indentguides'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" aurtomatically start limelight when entering Goyo mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" nerdtree settings

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-markdown settings

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" options for HTML autocomplete

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.

let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'

let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''

let g:closetag_close_shortcut = '<leader>>'

" ALE fixer settings
let b:ale_fixers = ['prettier', 'eslint']

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1

" end

