vim.cmd([[
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  endif
]])
