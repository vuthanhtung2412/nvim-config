return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Configure all servers with the file operations capabilities
    setup = {
      -- This will run for all servers
      ["*"] = function(server, opts)
        local default_capabilities = vim.lsp.protocol.make_client_capabilities()
        local file_ops_capabilities = require("lsp-file-operations").default_capabilities()

        opts.capabilities = vim.tbl_deep_extend("force", default_capabilities, file_ops_capabilities)
      end,
    },
  },
}
