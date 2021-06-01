require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'everforest',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
  },
})

vim.o.showmode = false
if os.getenv('termTheme') == 'light' then
  vim.o.background = 'light'
end
