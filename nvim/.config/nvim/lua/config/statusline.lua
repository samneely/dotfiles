require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  },
  sections = {
    lualine_c = { {'filename', full_path = true} },
  },
})

vim.o.showmode = false
if os.getenv('termTheme') == 'light' then
  vim.o.background = 'light'
end
