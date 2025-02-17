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

-- vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard
--
-- if vim.env.SSH_CLIENT then
--   vim.g.clipboard = {
--     name = 'OSC 52',
--     copy = {
--       ['+'] = {
--         'sh', '-c',
--         "printf '\\033]52;c;%s\\007' \"$(printf '%s' $1 | base64)\"",
--         '--',
--       },
--       ['*'] = {
--         'sh', '-c',
--         "printf '\\033]52;c;%s\\007' \"$(printf '%s' $1 | base64)\"",
--         '--',
--       },
--     },
--     paste = {
--       ['+'] = nil,
--       ['*'] = nil,
--     },
--     cache_enabled = false,
--   }
-- end

-- clipboard overrides is needed as Alacritty does not support runtime OSC 52 detection.
-- We need to customize the clipboard depending on whether in tmux, in SSH_TTY or not.
--  In Tmux, there are 2 clipboard providers
--  1. Tmux
--  2. OSC52 should also work by default.
--  In SSH_TTY, OSC 52 should work, but needs to be overridden as I use Alacritty.
--  In local (not SSH session), LazyVim default clipboard providers can be used.
--   Sample references -
--   https://github.com/folke/which-key.nvim/issues/584 - Has references to when clipboard is modified
--   Some more info here - https://www.reddit.com/r/neovim/comments/17rbbec/neovim_nightly_now_you_can_copy_via_ssh_with/
--
--
--  You can test OSC 52 in terminal by using following in your terminal -
--  printf $'\e]52;c;%s\a' "$(base64 <<<'hello world')"
local is_tmux_session = vim.env.TERM_PROGRAM == "tmux" -- Tmux is its own clipboard provider which directly works.
-- TMUX documentation about its clipboard - https://github.com/tmux/tmux/wiki/Clipboard#the-clipboard
if vim.env.SSH_TTY and not is_tmux_session then
   local function paste()
     return { vim.fn.split(vim.fn.getreg(""), "\n"),       vim.fn.getregtype("") }
   end
   local osc52 = require("vim.ui.clipboard.osc52")
   vim.g.clipboard = {
     name = "OSC 52",
     copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
   }
 end
