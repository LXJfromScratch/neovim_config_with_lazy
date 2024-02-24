return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'UIEnter',
  config = function()
    local function winbar()
      return require("lspsaga.symbol.winbar").get_bar() or ""
    end
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        globalstatus = true,
      },
      sections = {
        lualine_c = { winbar },
        lualine_x = { 'encoding', 'filesize' }
      }
    }
  end
}
