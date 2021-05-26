-- Load .vimrc
vim.cmd([[runtime .vimrc]])

-- Neovim specific settings
vim.o.icm = 'split'

-- PLUGINS
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'
  
  -- Vim startup profiling
  use 'tweekmonster/startuptime.vim'
  
  -- UI
  use 'ayu-theme/ayu-vim'
  use 'editorconfig/editorconfig-vim' -- editorconfig for being polite
  use 'hoob3rt/lualine.nvim'
  use 'lewis6991/gitsigns.nvim'       -- gitsigns
  use 'tpope/vim-abolish'             -- rename... could be LSP'd away someday
  use 'tpope/vim-commentary'          -- easy comments
  use 'tpope/vim-eunuch'              -- handle missing files and unix-y stuff
  use 'tpope/vim-repeat'              -- repeat actions
  use 'scrooloose/nerdtree'
  
  -- Editing help
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  
  -- Syntax
  ---- Ruby
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-haml'
  use 'slim-template/vim-slim'
  ---- JavaScript / TypeScript / CSS
  use 'pangloss/vim-javascript'
  use 'maxmellon/vim-jsx-pretty'
  use 'kchmck/vim-coffee-script'
  use 'styled-components/vim-styled-components'
  use 'leafgarland/typescript-vim'
  ---- GraphQL
  use 'jparise/vim-graphql'
  
  -- Testing
  use 'janko-m/vim-test'
  
  -- Markdown Preview
  use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install'}
  
  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  use 'tpope/vim-rhubarb'
  
  -- Formatting
  use 'sbdchd/neoformat'
  
  -- Find/Replace everywhere
  use 'mileszs/ack.vim'
  use 'olical/vim-enmasse' -- editing multiple files in buffer
  
  -- Fuzzy Finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  
  -- LSP / Completions
  use 'ervandew/supertab'
  use 'folke/trouble.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'nvim-lua/popup.nvim'
  use {'nvim-treesitter/nvim-treesitter', hook = ':TSUpdate'}
  
  -- devicons
  use 'ryanoasis/vim-devicons'
  
end)

vim.o.fileencoding="utf-8"
vim.o.guifont = "Hack\\ Regular\\ Nerd\\ Font\\ Complete\\ Mono:h14"

-- THEME
vim.cmd [[let ayucolor = 'mirage']]
vim.cmd [[colorscheme ayu]]

-- statusline
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  },
  sections = {
    lualine_c = { {'filename', full_path = true} },
  },
}

vim.o.showmode = false
if os.getenv('termTheme') == 'light' then
  vim.o.background = 'light'
end

-- UI
gitsigns = require('gitsigns')
gitsigns.setup()

-- Testing config
vim.api.nvim_set_keymap('n', '<localleader>s', ":TestNearest<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>t', ":TestFile<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>a', ":TestSuite<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>l', ":TestLast<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>g', ":TestVisit<cr>", {noremap = true, silent = true})
vim.cmd [[let g:test#javascript#runner = 'jest']]

-- telescope for finding stuff
vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').git_files()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>", {noremap = true, silent = true})

-- Neoformat
vim.cmd [[autocmd BufWritePre *.js Neoformat]]
vim.cmd [[autocmd BufWritePre *.jsx Neoformat]]
vim.cmd [[autocmd BufWritePre *.ts Neoformat]]
vim.cmd [[autocmd BufWritePre *.tsx Neoformat]]

-- Trouble
require("trouble").setup()
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

-- Ack.vim
vim.cmd([[
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
]])

-- LSP LANGUAGE SERVERS
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
    autocmd!
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

local lspconfig = require('lspconfig')

local function root_pattern(...)
  local patterns = vim.tbl_flatten {...}

  return function(startpath)
    for _, pattern in ipairs(patterns) do
      return lspconfig.util.search_ancestors(
        startpath,
        function(path)
          if lspconfig.util.path.exists(vim.fn.glob(lspconfig.util.path.join(path, pattern))) then
            return path
          end
        end
      )
    end
  end
end

-- LSP / Ruby
require'lspconfig'.solargraph.setup({
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = root_pattern("Gemfile", ".git"),
  on_attach = on_attach,
  settings = {
    solargraph = {
      diagnostics = false,
      useBundler = true
    }
  }
})

-- LSP / TypeScript
require'lspconfig'.tsserver.setup({on_attach = on_attach})

-- Ruby / Syntax highlighting
vim.cmd [[autocmd BufNewFile,BufRead,BufReadPost *.survey set filetype=ruby]]

-- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

-- floating windows
local saga = require('lspsaga')
saga.init_lsp_saga()
-- code finder
vim.api.nvim_set_keymap('n',
  'gh',
  "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",
  {noremap = true, silent = true})
-- docs
vim.api.nvim_set_keymap('n',
  'K',
  "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',
  '<C-f>',
  "<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>",
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',
  '<C-b>',
  "<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>",
  {noremap = true, silent = true})
-- code actions
vim.api.nvim_set_keymap('n',
  '<space>ca',
  "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('v',
  '<space>ca',
  "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>",
  {noremap = true, silent = true})
-- signature help
vim.api.nvim_set_keymap('n',
  '<space>k',
  "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
  {noremap = true, silent = true})
-- rename
vim.api.nvim_set_keymap('n',
  '<space>rn',
  "<cmd>lua require('lspsaga.rename').rename()<CR>",
  {noremap = true, silent = true})
-- preview definition
vim.api.nvim_set_keymap('n',
  '<space>gd',
  "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>",
  {noremap = true, silent = true})
-- diagnostics
vim.api.nvim_set_keymap('n',
  '<space>d',
  "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',
  '[d',
  "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',
  ']d',
  "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
  {noremap = true, silent = true})
