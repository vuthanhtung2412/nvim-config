return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- Add "document_symbols" to the sources list https://github.com/nvim-neo-tree/neo-tree.nvim/issues/879
      table.insert(opts.sources, "document_symbols")
    end,
    keys = {
      {
        "<leader>se",
        function()
          require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
        end,
        desc = "Document Symbols Explorer",
      },
    },
  },
}
