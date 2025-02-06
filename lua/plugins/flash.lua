return {
  "folke/flash.nvim",
  keys = {
    -- Disable s since it is used for sentence text object
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
  },
  config = true,
}
