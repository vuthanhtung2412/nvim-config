-- ~/.config/nvim/lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft.markdown = {} -- remove markdown linting
  end,
}
