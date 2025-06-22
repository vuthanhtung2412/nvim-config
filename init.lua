-- Set specific JSON files to be treated as jsonc
vim.filetype.add({
  filename = {
    ["tsconfig.json"] = "jsonc",
    ["jsconfig.json"] = "jsonc",
    [".eslintrc.json"] = "jsonc",
  },
  pattern = {
    [".*%.json"] = "jsonc", -- Treat all .json files as jsonc
  },
})

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
