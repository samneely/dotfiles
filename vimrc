set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"""""" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'

"""""" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx' ""Requires pangloss/vim-javascript
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'

"""""" Vue
Plugin 'posva/vim-vue'

"""""" Ember
Plugin 'yalesov/vim-emblem'

"""""" Elixir
Plugin 'elixir-lang/vim-elixir'

"""""" Web
Plugin 'mattn/emmet-vim'

"""""" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'

"""""" Vim
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'bogado/file-line'

"""""" Vim - searching/editing
Plugin 'olical/vim-enmasse' " editing multiple files in buffer
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-multiple-cursors'

"""""" Vim - colors
Plugin 'tomasr/molokai'
Plugin 'ayu-theme/ayu-vim'

call vundle#end() "required for Vundle
filetype plugin indent on "required for Vundle

"""""" Ack.vim config
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

"""""" vim-rspec Config
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "be rspec {spec}"

"""""" Emmet config
autocmd FileType html,css,javascript.jsx EmmetInstall
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

"""""" ctrl-p config
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|bower_components|node_modules|tmp|_build'

"""""" Config
syntax on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2 number
set mouse=a
set cc=120
set hlsearch
set guifont=Menlo:h14

"""""" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""" Split config
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"""""" Color Config
"colorscheme molokai
"let g:molokai_original = 1
set termguicolors
let ayucolor = 'mirage'
colorscheme ayu

"""""" Local project config
set exrc
set secure

"""""" Indent Config
"let g:indent_guides_start_level = 2

  "" shortcut to rapidly toggle 'set list'
  "nmap <leader>l :set list!<CR>

  "" use the same symbols as TextMate for tabstops and EOLs
  "set listchars=tab:▸\ ,eol:¬