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
      -- TODO: launch.json not working
      "mxsdev/nvim-dap-vscode-js",
      opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
        adapters = { "chrome", "pwa-node", "pwa-chrome", "pwa-msedge", "pwa-extensionHost", "node-terminal" },
      },
      config = function(_, opts)
        require("dap-vscode-js").setup(opts)

        for _, language in ipairs(js_based_languages) do
          require("dap").configurations[language] = {
            -- Error : No configuration found for `snacks_dashboard`. You need to add configs to `dap.configurations.snacks_dashboard` (See `:h dap-configuration`)
            -- {
            --   type = "pwa-chrome",
            --   request = "launch",
            --   name = "Launch & Debug Chrome",
            --   url = function()
            --     local co = coroutine.running()
            --     return coroutine.create(function()
            --       vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:3000" }, function(url)
            --         if url == nil or url == "" then
            --           return
            --         else
            --           coroutine.resume(co, url)
            --         end
            --       end)
            --     end)
            --   end,
            --   webRoot = vim.fn.getcwd(),
            --   protocol = "inspector",
            --   sourceMaps = true,
            --   userDataDir = false,
            -- },
          }
        end
      end,
    },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
  },
}
