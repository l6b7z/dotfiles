return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    -- vim.cmd('HighlightColorsOn')
  require("nvim-highlight-colors").setup {
	enable_named_colors = true,
	enable_tailwind = true,
}
end,
}

