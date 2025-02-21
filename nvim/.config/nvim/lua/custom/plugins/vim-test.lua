return {
  'janko-m/vim-test',
  config = function()
    vim.keymap.set('n', '<leader>ts', function()
      vim.cmd ':TestNearest'
    end, { desc = 'Run the neare[s]t test' })

    vim.keymap.set('n', '<leader>tt', function()
      vim.cmd ':TestFile'
    end, { desc = 'Run the current [t]est file' })

    vim.keymap.set('n', '<leader>ta', function()
      vim.cmd ':TestSuite'
    end, { desc = 'Run [a]ll of the test suite' })

    vim.keymap.set('n', '<leader>tl', function()
      vim.cmd ':TestLast'
    end, { desc = 'Rerun the [l]ast test command' })

    vim.cmd "let g:test#javascript#runner = 'test'"
    vim.cmd "let test#ruby#rspec#executable = '~/code/ezcater/eztilt/run rspec'"
  end,
}
