if true then return {} end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  enabled = false,
  opts = {
    mode = "legacy",
    -- claude 3.7 is the best
    provider = "copilot",
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
    -- all tools can be found here : https://github.com/yetone/avante.nvim/tree/main/lua/avante/llm_tools
    disabled_tools = {
      "run_python",
      "bash",
      -- these agentic features are too buggy
      "replace_in_file",
      "dispatch_agent",
      "insert",
      "write_to_file",
      "delete_tool_use_messages",
    },
    auto_approve_tool_permissions = {
      "rag_search",
      "git_diff",
      "list_files",
      "search_files",
      "search_keyword",
      "read_file_toplevel_symbols",
      "view",
      "read_file",
      "create_file",
      "create_dir",
      "web_search",
      "fetch",
    },
    -- behaviour = {
    --   enable_cursor_planning_mode = true,
    -- },
  },
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante chat session" },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
