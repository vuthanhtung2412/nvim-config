if true then
  return {}
end

return {
  -- Make sure fzf-lua is installed
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- TODO: This is not working correctly
    config = function()
      -- Basic configuration for fzf-lua
      require("fzf-lua").setup({
        -- You can add any default fzf-lua config here
        -- Or leave empty for defaults
      })

      -- Create function for grepping only open buffers
      local function grep_open_buffers()
        local buffers = {}
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
            local path = vim.api.nvim_buf_get_name(buf)
            if path and path ~= "" then
              table.insert(buffers, path)
            end
          end
        end

        require("fzf-lua").live_grep({
          prompt = "Grep Open Buffers> ",
          file_include = buffers,
        })
      end

      -- Register as a user command
      vim.api.nvim_create_user_command("GrepOpenBuffers", grep_open_buffers, {})

      -- Set up keymapping
      vim.keymap.set("n", "<leader>sg", function()
        grep_open_buffers()
      end, { desc = "Grep in open buffers" })
    end,
  },

  -- If you're using LazyVim's which-key extension, you can add a description
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>s"] = { name = "+search" },
        ["<leader>sg"] = { name = "Grep open buffers" },
      },
    },
  },
}
