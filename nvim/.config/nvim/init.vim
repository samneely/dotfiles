set nocompatible
set t_Co=256

"==================================
" Initialize
"==================================

call plug#begin('~/.vim/plugged')

" Debugging Vim
Plug 'tweekmonster/startuptime.vim'

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': ['ruby', 'erb', 'slim', 'haml']}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'slim-template/vim-slim', {'for': 'slim'}

" Frontend
Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx']}
Plug 'maxmellon/vim-jsx-pretty', {'for': ['js', 'jsx', 'ts', 'tsx']}
Plug 'kchmck/vim-coffee-script', {'for': ['js', 'coffee']}
Plug 'styled-components/vim-styled-components', {'branch': 'main', 'for': ['js', 'jsx', 'ts', 'tsx']}
Plug 'jparise/vim-graphql', {'for': ['js', 'jsx', 'ts', 'tsx', 'graphql']}
Plug 'leafgarland/typescript-vim', {'for': ['ts', 'tsx']}

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" LSP / Completions
Plug 'ervandew/supertab'

" Linting and autoformatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'

" Test
Plug 'janko-m/vim-test'

" Vim
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession', {'on': 'Obsess'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTree'}
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bogado/file-line'
Plug 'junegunn/vim-easy-align'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Finding / Searching / Editing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'olical/vim-enmasse' " editing multiple files in buffer
Plug 'mileszs/ack.vim', {'on': 'Ack'}

" Themes
Plug 'ayu-theme/ayu-vim'

call plug#end()

" Finding / Searching config
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_action = {
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit',
\ 'ctrl-t': 'tabnew'
\ }
nnoremap <c-p> :FZF<cr>


" vim-test
nmap <silent> <Leader>s :TestNearest<CR>
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>a :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>
let g:test#javascript#runner = 'jest'

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
let g:ale_linters = {
      \'ruby': ['standardrb'],
      \'js': ['prettier', 'eslint'],
      \'jsx': ['prettier', 'eslint'],
      \'ts': ['prettier', 'eslint'],
      \'tsx': ['prettier', 'eslint'],
      \}
let g:ale_fixers = {
      \'javascript': ['prettier', 'eslint'],
      \'typescript': ['prettier', 'eslint'],
      \}
let g:ale_fix_on_save = 1

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
