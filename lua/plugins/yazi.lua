return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>y",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>Y",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_file_function = function(chosen_file, config, state)
      -- Use system open instead of opening in Neovim
      -- For macOS
      vim.fn.system("open " .. vim.fn.shellescape(chosen_file))
      -- For Linux
      -- vim.fn.system("xdg-open " .. vim.fn.shellescape(chosen_file))
    end,
    open_for_directories = false,
    keymaps = {
      show_help = "g?",
    },
  },
}
