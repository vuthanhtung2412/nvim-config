-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { silent = true })
-- vim.keymap.set("i", "jj", "<Esc>:w<CR>", { silent = true })
vim.keymap.set("t", ";;", "<C-\\><C-n>", { silent = true })
-- Prevent change and delete motion from sending to the clipboard in normal mode
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "X", '"_X', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "r", '"_r', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "yY", "_y$", { noremap = true, silent = true })
-- inspration : https://stackoverflow.com/a/77247473/14281306
vim.api.nvim_set_keymap("x", "il", "g_o^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "il", ":<C-u>normal vil<CR>", { noremap = true, silent = true })
-- inspration : https://stackoverflow.com/a/16136133
vim.keymap.set({ "n" }, "oo", "o<ESC>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "OO", "O<ESC>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "F", "<nop>", { noremap = true, silent = true })
-- Yank relative file path to CWD
vim.keymap.set("n", "<leader>fp", function()
  vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand("%"), ":."))
end, { desc = "Yank relative file path", silent = true })

-- Yank absolute file path
vim.keymap.set("n", "<leader>fP", function()
  vim.fn.setreg("+", vim.fn.expand("%:p")) -- absolute path
end, { desc = "Yank absolute file path", silent = true })

-- Keymap only for Terraform files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform", -- Only apply to terraform files
  callback = function()
    vim.keymap.set(
      "n",
      "gx",
      ":OpenDoc<CR>",
      { noremap = true, silent = true, buffer = true, desc = "Open Terraform Doc" }
    )
  end,
})

-- https://www.reddit.com/r/neovim/comments/ro6oye/open_link_from_neovim/
vim.keymap.set(
  "n",
  "gx",
  [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]],
  { noremap = true, silent = true }
)

-- search by directory then grep
-- https://www.reddit.com/r/neovim/comments/1ifcksk/comment/majansf/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.keymap.set("n", "<leader>fdg", function()
  -- Get a list of all directories in the workspace
  local workspace_path = vim.fn.getcwd()
  local directories = vim.fn.systemlist("find " .. workspace_path .. " -type d")

  -- Present the directories to the user for selection
  vim.ui.select(directories, {
    prompt = "Select a directory:",
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice then
      require("snacks").picker.grep({ dirs = { choice } })
    else
      print("No directory selected")
    end
  end)
end, { desc = "Grep directory" })

-- Get current selection position
vim.keymap.set("v", "<leader>@", function()
  -- Get current file path relative to CWD
  local file_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")

  -- Get start and end line of selection
  local start_line = vim.fn.line("v")
  -- FIXME: not resistant to O in selection mode
  local end_line = vim.fn.line(".") --Line number of the cursor

  -- Ensure correct ordering
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Format string like "@path#Lstart-Lend"
  local pos_str = string.format("@%s#L%d-L%d", file_path, start_line, end_line)

  -- Copy to system clipboard
  vim.fn.setreg("+", pos_str)

  -- Notify user
  print("Copied position: " .. pos_str)
end, { desc = "Coord of selection", silent = true })

-- Get current symbol code path
vim.keymap.set("n", "<leader>sy", function()
  if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{symbol.name}",
    })
    
    if symbols.has() then
      local raw_path = symbols.get()
      -- Clean up highlight groups, stars, and format as dot-separated path
      local clean_path = raw_path:gsub("%%#[^#]*#", ""):gsub("%%*", ""):gsub("%*", ""):gsub("%s+", "."):gsub("^%.+", ""):gsub("%.+$", "")
      vim.fn.setreg("+", clean_path)
      print("Copied: " .. clean_path)
      return
    end
  end
  
  -- Fallback
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("+", word)
  print("Copied: " .. word)
end, { desc = "Yank symbol path" })

-- Disable "q" for macro and "q:" for command history since I rarely use it
vim.keymap.set({ "n", "v" }, "q", "<Nop>", { noremap = true, silent = true })


-- Yank relative file paths of all files visible in the current window/tab
vim.keymap.set("n", "<leader>fa", function()
  local win_ids = vim.api.nvim_tabpage_list_wins(0)
  local paths = {}
  for _, win in ipairs(win_ids) do
    local buf = vim.api.nvim_win_get_buf(win)
    local path = vim.api.nvim_buf_get_name(buf)
    if path ~= "" then
      table.insert(paths, "@" .. vim.fn.fnamemodify(path, ":."))
    end
  end
  vim.fn.setreg("+", table.concat(paths, "\n"))
end, { desc = "Yank visible relative file paths", silent = true })

