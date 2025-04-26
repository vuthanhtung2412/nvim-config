return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
  },
  opts = {
    sources = {
      -- Updated default sources list with snippets instead of luasnip
      default = { "avante" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {
            -- options for blink-cmp-avante
          },
        },
      },
    },
  },
}
