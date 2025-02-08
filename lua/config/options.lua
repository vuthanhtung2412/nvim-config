-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.opt.winbar = "%=%m %f"
vim.g.autoformat = false
vim.g.snacks_animate = false
-- https://www.reddit.com/r/vim/comments/7xs8x3/opening_local_relative_paths_with_gx/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- vim.keymap.set("n", "gx", function()
--   local file_path = vim.fn.expand("<cfile>")
--   local dir = vim.fn.expand("%:p:h")
--   vim.cmd("silent !cd " .. dir .. " && open " .. file_path)
-- end, { silent = true })

-- terminal setup
vim.api.nvim_command("autocmd TermOpen * startinsert")
vim.api.nvim_command("autocmd TermOpen * setlocal number")
vim.api.nvim_command("autocmd TermEnter * setlocal relativenumber")

vim.o.clipboard = "unnamedplus"
-- source : https://github.com/ojroques/nvim-osc52?tab=readme-ov-file#using-nvim-osc52-as-clipboard-provider
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}
