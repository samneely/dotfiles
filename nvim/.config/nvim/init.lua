-- Load .vimrc
vim.cmd([[runtime .vimrc]])

-- Neovim specific settings
vim.o.icm = 'split'

require('plugins')

vim.o.fileencoding = "utf-8"
vim.o.guifont = "Hack Regular Nerd Font Complete Mono:h14"
require('nvim-web-devicons').get_icons()

require('work-settings')
