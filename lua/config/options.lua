-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.opt.winbar = "%=%m %f"
vim.g.autoformat = false
-- https://www.reddit.com/r/vim/comments/7xs8x3/opening_local_relative_paths_with_gx/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.keymap.set("n", "gx", function()
  local file_path = vim.fn.expand("<cfile>")
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("silent !cd " .. dir .. " && open " .. file_path)
end, { silent = true })
