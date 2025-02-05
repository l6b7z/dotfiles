return{
 "akinsho/toggleterm.nvim",
  config = function()
  require("toggleterm").setup{
      shade_terminals = false,
      highlights = {
        Normal = { guibg = "#000000" },
      }
    }
  end,
}
