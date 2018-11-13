set nocompatible
set t_Co=256

"==================================
" Initialize
"==================================

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': ['ruby', 'erb', 'slim', 'haml']}
Plug 'thoughtbot/vim-rspec', {'for': ['ruby', 'spec']}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'slim-template/vim-slim', {'for': 'slim'}

Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx']}
Plug 'mxw/vim-jsx', {'for': ['js', 'jsx']} " Requires pangloss/vim-javascript
Plug 'kchmck/vim-coffee-script', {'for': ['js', 'coffee']}
Plug 'mustache/vim-mustache-handlebars', {'for': ['js', 'handlebars']}
Plug 'posva/vim-vue', {'for': ['js', 'vue']}
Plug 'yalesov/vim-emblem', {'for': ['js', 'emblem']} " for Ember.js
Plug 'elixir-lang/vim-elixir', {'for': ['ex', 'exs']}
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Vim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bogado/file-line'
Plug 'junegunn/vim-easy-align'

" Searching / Editing
Plug 'olical/vim-enmasse' " editing multiple files in buffer
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'

" Themes
Plug 'ayu-theme/ayu-vim'

call plug#end()

" Ack.vim config
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" vim-rspec Config
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = ":!bundle exec rspec {spec}"

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_action = {
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\ }
nnoremap <c-p> :FZF<cr>

" Config
syntax on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2 number
set mouse=a
set cc=120 " Line limit delimiter
set hlsearch
set guifont=Menlo:h14

" ALE
let g:airline#extensions#ale#enabled = 1

" nerdcommenter
let g:NERDSpaceDelims = 1

" Splits / Grids
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Colors / Theme
set termguicolors
let ayucolor = 'mirage'
colorscheme ayu

" Syntax highlighting
autocmd BufNewFile,BufRead,BufReadPost *.survey set filetype=ruby

" Local project vimrc
set exrc
set secure
