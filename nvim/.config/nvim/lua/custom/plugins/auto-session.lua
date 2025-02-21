return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
        load_on_setup = true,
        previewer = false,
        mappings = {
          -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
          delete_session = { 'i', '<C-D>' },
          alternate_session = { 'i', '<C-S>' },
          copy_session = { 'i', '<C-Y>' },
        },
        -- Can also set some Telescope picker options
        -- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
        theme_conf = {
          border = true,
          -- layout_config = {
          --   width = 0.8, -- Can set width and height as percent of window
          --   height = 0.5,
          -- },
        },
      },
    }

    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    vim.keymap.set('n', '<leader>wl', function()
      vim.cmd 'SessionSearch'
    end, { desc = '[W]orkspace [L]ist - Session search' })

    vim.keymap.set('n', '<leader>ww', function()
      vim.cmd 'SessionSave'
    end, { desc = '[W]orkspace [W]rite - Save session' })

    vim.keymap.set('n', '<leader>wa', function()
      vim.cmd 'SessionToggleAutoSave'
    end, { desc = '[W]orkspace - Toggle session [a]utosave' })
  end,
}
