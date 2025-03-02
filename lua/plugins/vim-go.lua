return {
  "fatih/vim-go",
  enabled = false,
  -- This mess up neovim doc hover urghhhh
  -- I use this only for GoIfErr, I should just create snippet
  config = function()
    vim.g.go_fmt_autosave = 0
  end,
}
