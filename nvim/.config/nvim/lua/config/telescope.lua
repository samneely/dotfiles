vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').git_files()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>", {noremap = true, silent = true})
