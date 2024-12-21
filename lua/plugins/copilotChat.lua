return {
  -- I just yoinked the link below
  -- https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    question_header = "User ",
    answer_header = "Copilot ",
    error_header = "Error ",
    auto_follow_cursor = false,
    window = {
      width = 0.3,
    },
    mappings = {
      reset = {
        normal = "<leader>ax",
        insert = "<leader>ax",
      },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)

    local select = require("CopilotChat.select")
    vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
      chat.ask(args.args, { selection = select.visual })
    end, { nargs = "*", range = true })

    vim.api.nvim_create_user_command("CopilotChatInline", function(args)
      chat.ask(args.args, {
        selection = select.visual,
        window = {
          layout = "float",
          relative = "cursor",
          width = 1,
          height = 0.4,
          row = 1,
        },
      })
    end, { nargs = "*", range = true })

    vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
      chat.ask(args.args, { selection = select.buffer })
    end, { nargs = "*", range = true })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-*",
      callback = function()
        vim.opt_local.relativenumber = true
        vim.opt_local.number = true

        -- Get current filetype and set it to markdown if the current filetype is copilot-chat
        local ft = vim.bo.filetype
        if ft == "copilot-chat" then
          vim.bo.filetype = "markdown"
        end
      end,
    })
  end,
  event = "VeryLazy",
}
