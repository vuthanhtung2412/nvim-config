return {
  "CopilotC-Nvim/CopilotChat.nvim",
  -- ... other config remains the same ...
  config = function(_, opts)
    local chat = require("CopilotChat")
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-*",
      callback = function()
        vim.opt_local.relativenumber = true  -- Changed to true
        vim.opt_local.number = true          -- Changed to true
      end,
    })
    chat.setup(opts)
  end,
}
