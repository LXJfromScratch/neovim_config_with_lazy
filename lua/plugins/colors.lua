return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = {
      transparent = true,
      terminal_colors = true,
      dim_inactive = false,
      hide_inactive_statusline = true,
      lualine_bold = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
        comments = { italic = true },
      },
      on_colors = function(colors)
        colors.comment = '#BFEFFF'
        colors.cyan = '#00FFFF'
        colors.fg = '#F8F8FF'
        colors.green = '#C0FF3E'
        colors.green1 = '#00FA9A'
        colors.orange = '#FFA500'
        colors.yellow = '#FFD700'
        colors.fg_dark = '#E0FFFF'
        colors.dark3 = '#98F5FF'
        -- colors.fg_gutter = '#CD4F39' -- number line
        colors.fg_gutter = '#EE5C42' -- number line
        colors.bg_statusline = '#EE5C42'
        -- colors.blue5 = '#00BFFF'
        colors.fg_sidebar = '#000000'
        colors.gitSigns = { add = "#00FF00", change = "#00FFFF", delete = "#FFFF00"}
      end
    }
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    opts = {
      disable_background = true,
      disable_float_background = true,
    }
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      transparent_mode = true,
      bold = true,
      contrast = 'hard',
    },
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = true,
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
          terminal_colors = true,
        },
      })
    end
  },
}
