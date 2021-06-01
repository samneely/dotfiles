-- Load .vimrc
vim.cmd([[runtime .vimrc]])

-- Neovim specific settings
vim.o.icm = 'split'

-- PLUGINS
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Vim startup profiling
  use 'tweekmonster/startuptime.vim'

  -- package manager
  use 'wbthomason/packer.nvim'
  
  -- UI
  use {
    'ayu-theme/ayu-vim',
    config = function() require('config.colorsettings') end
  }
  use 'editorconfig/editorconfig-vim' -- editorconfig for being polite
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('config.statusline') end
  }
  use 'tpope/vim-abolish'             -- rename... could be LSP'd away someday
  use 'tpope/vim-commentary'          -- easy comments
  use 'tpope/vim-eunuch'              -- handle missing files and unix-y stuff
  use 'tpope/vim-repeat'              -- repeat actions
  use {'scrooloose/nerdtree', cmd = 'NERDTree'}

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  use 'tpope/vim-rhubarb'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('gitsigns').setup() end
  }
  
  -- Editing help
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  
  -- Syntax
  ---- Ruby
  use {'vim-ruby/vim-ruby', ft = {'rb', 'erb', 'haml', 'slim'}}
  use {'tpope/vim-haml', ft = {'haml'}}
  use {'slim-template/vim-slim', ft = {'slim'}}

  ---- JavaScript / TypeScript / CSS
  use {'pangloss/vim-javascript', ft = {'js', 'jsx', 'ts', 'tsx', 'erb', 'haml', 'slim'}}
  use {'maxmellon/vim-jsx-pretty', ft = {'js', 'jsx', 'ts', 'tsx', 'erb', 'haml', 'slim'}}
  use {'kchmck/vim-coffee-script', ft = {'erb', 'coffee', 'haml', 'slim'}}
  use {'styled-components/vim-styled-components', ft = {'js', 'jsx', 'ts', 'tsx'}}
  use {'leafgarland/typescript-vim', ft = {'ts', 'tsx'}}
  ---- GraphQL
  use {'jparise/vim-graphql', ft = {'js', 'jsx', 'ts', 'tsx', 'graphql', 'gql'}}
  
  -- Testing
  use {
    'janko-m/vim-test',
    config = function() require('config.testing') end
  }
  
  -- Markdown Preview
  use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install'}
  
  -- Formatting
  use {
    'sbdchd/neoformat',
    config = function() require('config.formatting') end
  }
  
  -- Find/Replace everywhere
  -- use :cdo s/OldName/NewName/gc to replace across files
  -- https://vimtricks.com/p/interactive-replace-across-files/
  use {
    'mileszs/ack.vim',
    cmd = 'Ack',
    config = function() require('config.ack') end
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('config.telescope') end
  }

  -- Linting
  use {
    'folke/trouble.nvim',
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = function() require('config.trouble') end
  }
  
  -- LSP / Completions
  -- use {
  --   'glepnir/lspsaga.nvim',
  --   config = function() require('config.lspsaga') end
  -- }
  use {
    'neovim/nvim-lspconfig',
    config = function() require('config.lsp_server_config') end
  }
  use {
    'hrsh7th/nvim-compe',
    requires = {'hrsh7th/vim-vsnip'},
    config = function() require('config.lspcompletion') end
  }

  use 'nvim-lua/lsp_extensions.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    hook = ':TSUpdate',
    config = function() require('config.treesitter') end
  }
end)

vim.o.fileencoding="utf-8"
vim.o.guifont = "Hack\\ Regular\\ Nerd\\ Font\\ Complete\\ Mono:h14"

require('work-settings')
