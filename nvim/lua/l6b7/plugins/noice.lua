-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",

      format = {
      search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
       cmdline = { pattern = "^:", icon = "_", lang = "vim" },},
      },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    }
}
