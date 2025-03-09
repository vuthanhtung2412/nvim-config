return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case -U",
    },
  },
}
