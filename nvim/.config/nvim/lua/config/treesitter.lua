require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "elixir",
    "go",
    "gomod",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "regex",
    "ruby",
    "scss",
    "tsx",
    "typescript",
    "yaml"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

