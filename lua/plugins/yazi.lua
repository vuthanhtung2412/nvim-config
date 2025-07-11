return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>y",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>Y",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_file_function = function(chosen_file, config, state)
      -- Popular media file extensions lookup table
      local media_extensions = {
        -- Images
        jpg = true,
        jpeg = true,
        png = true,
        gif = true,
        webp = true,
        svg = true,
        pdf = true,
        -- Videos
        mp4 = true,
        avi = true,
        mov = true,
        mkv = true,
        webm = true,
        -- Audio
        mp3 = true,
        wav = true,
        flac = true,
        aac = true,
        ogg = true,
      }

      -- Get file extension and check if it's a media file
      local extension = chosen_file:match("^.+%.(.+)$")
      if extension and media_extensions[extension:lower()] then
        -- Use system open for media files
        vim.fn.system("open " .. vim.fn.shellescape(chosen_file))
      else
        -- Use default behavior (open in Neovim) for non-media files
        vim.cmd("edit " .. vim.fn.fnameescape(chosen_file))
      end
    end,
    open_for_directories = false,
    keymaps = {
      show_help = "g?",
    },
  },
}
