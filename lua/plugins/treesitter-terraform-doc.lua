return {
    "Afourcat/treesitter-terraform-doc.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-terraform-doc").setup({
        command_name = "OpenDoc",
        url_opener_command = "!open",  -- Change to your preferred browser
        jump_argument = true,
      })
    end
}
