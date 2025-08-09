-- ~/.config/nvim/lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    -- other useful link : https://github.com/LazyVim/LazyVim/discussions/2268#discussioncomment-7970989
    opts.linters_by_ft.markdown = {} -- remove markdown linting
  end,
}
