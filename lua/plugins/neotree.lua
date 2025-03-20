return {
  "nvim-neo-tree/neo-tree.nvim",
  -- enabled = false,
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    -- window = {
    --   position = "float",
    -- },
    document_symbols = {
      window = {
        mappings = {
          ["l"] = "toggle_node",
        },
      },
    },
  },
}

-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "MunifTanjim/nui.nvim",
--   },
--   config = function()
--     -- Unless you are still migrating, remove the deprecated commands
--     vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--
--     require("neo-tree").setup({
--       -- Use all defaults from defaults.lua except what we override here
--       window = {
--         mappings = {
--           ["<space>"] = "toggle_node",
--           ["<cr>"] = "open",
--           ["l"] = "open",
--           ["h"] = "close_node",
--           ["s"] = "open_vsplit",
--           ["S"] = "open_split",
--           ["C"] = "close_node",
--           ["z"] = "close_all_nodes",
--           ["R"] = "refresh",
--           ["a"] = "add",
--           ["d"] = "delete",
--           ["r"] = "rename",
--           ["y"] = "copy_to_clipboard",
--           ["x"] = "cut_to_clipboard",
--           ["p"] = "paste_from_clipboard",
--           ["q"] = "close_window",
--           ["?"] = "show_help",
--         }
--       },
--       filesystem = {
--         window = {
--           mappings = {
--             ["H"] = "toggle_hidden",
--             ["f"] = "filter_on_submit",
--             ["/"] = "fuzzy_finder",
--             ["D"] = "fuzzy_finder_directory",
--             ["."] = "set_root",
--           }
--         }
--       }
--     })
--
--     -- Suggested keymaps from Neo-tree documentation
--     vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Explorer' })
--     vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = 'Focus Explorer' })
--   end,
-- }
