return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Optional, for markdown rendering with render-markdown.nvim
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown" },
      },
      ft = { "markdown" },
    },
  },
  ft = "hurl",
  opts = {
    -- Show debugging info
    debug = false,
    -- Show notification on run
    show_notification = false,
    -- Show response in popup or split
    -- Auto split display when code is error
    mode = "popup",
    -- Default formatter
    formatters = {
      json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
      html = {
        "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
        "--parser",
        "html",
      },
      xml = {
        "tidy", -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
        "-xml",
        "-i",
        "-q",
      },
    },
    -- Default mappings for the response popup or split views
    mappings = {
      close = "q", -- Close the response popup or split view
      next_panel = "<C-n>", -- Move to the next response popup window
      prev_panel = "<C-p>", -- Move to the previous response popup window
    },
  },
  keys = {
    { "<leader>r", desc = "+hurl", mode = { "n" } },
    -- Run API request
    { "<leader>rA", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
    { "<leader>ra", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
    { "<leader>re", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
    { "<leader>rE", "<cmd>HurlRunnerToEnd<CR>", desc = "Run Api request from current entry to end" },
  },
}
