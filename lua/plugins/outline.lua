return {
  'simrat39/symbols-outline.nvim',
  keys = {
    { "<leader>o", "<cmd>SymbolsOutline<CR>", desc = "SymbolsOutline" },
  },
  opts = {
    -- width = 20,
    relative_width = true,
    show_numbers = false,
    show_relative_numbers = false,
  },
  -- config = function()
  --   local opts = {
  --     -- width = 20,
  --     relative_width = true,
  --     show_numbers = false,
  --     show_relative_numbers = false,
  --   }
  --   require("symbols-outline").setup(opts)
  -- end
}
