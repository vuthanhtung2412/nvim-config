if true then return {} end

return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>ac",
      function()
        require("codecompanion").toggle()
      end,
      desc = "Toggle AI chat",
    },
  },
}
