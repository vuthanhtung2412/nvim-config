local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- vscode-js-debug adapter
    {
      "microsoft/vscode-js-debug",
      -- After install, build it and rename the dist directory to out
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
        adapters = { "chrome", "pwa-node", "pwa-chrome", "pwa-msedge", "pwa-extensionHost", "node-terminal" },
      },
      config = function(_, opts)
        require("dap-vscode-js").setup(opts)
        
        for _, language in ipairs(js_based_languages) do
          require("dap").configurations[language] = {}
        end
      end,
    },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
  },
}
