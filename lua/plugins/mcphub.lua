if true then return {} end

return {
  "ravitemer/mcphub.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  keys = {
    { "<leader>am", "<cmd>MCPHub<CR>", desc = "MCP set up" },
  },
  -- https://ravitemer.github.io/mcphub.nvim/configuration.html#default-configuration
  config = function()
    require("mcphub").setup({
      -- auto_approve = true,
      config = vim.fn.expand("~/.config/mcp.json"),
      extensions = {
        avante = {
          make_slash_commands = true,
        },
      },
    })
  end,
}
