return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    mode = "legacy",
    -- claude 3.7 is the best
    provider = "copilot",
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
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
    }, -- without mcp-hub
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
    -- disabled_tools = {
    --     "list_files",    -- Built-in file operations
    --     "search_files",
    --     "read_file",
    --     "create_file",
    --     "rename_file",
    --     "delete_file",
    --     "create_dir",
    --     "rename_dir",
    --     "delete_dir",
    --     "bash",         -- Built-in terminal access
    --     "python"
    -- }, -- with mcp-hub
    -- cursor_applying_provider = "groq", -- In this example, use Groq for applying, but you can also use any provider you want.
    -- behaviour = {
    --   --- ... existing behaviours
    --   enable_cursor_planning_mode = true, -- enable cursor planning mode!
    -- },
    -- vendors = {
    --   --- ... existing vendors
    --   groq = { -- define groq provider
    --     __inherited_from = "openai",
    --     api_key_name = "GROQ_API_KEY",
    --     endpoint = "https://api.groq.com/openai/v1/",
    --     model = "llama-3.3-70b-versatile",
    --     max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
    --   },
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
    --- The below dependencies are optional,
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
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
