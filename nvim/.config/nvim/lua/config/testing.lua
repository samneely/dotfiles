vim.api.nvim_set_keymap('n', '<localleader>s', ":TestNearest<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>t', ":TestFile<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>a', ":TestSuite<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>l', ":TestLast<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>g', ":TestVisit<cr>", {noremap = true, silent = true})
vim.cmd [[let g:test#javascript#runner = 'jest']]

