return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = {
      transparent = true,
      terminal_colors = true,
      dim_inactive = false,
      hide_inactive_statusline = false,
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
        colors.yellow = '#FFFF00'
        colors.fg_dark = '#E0FFFF'
        -- colors.blue = '#00BFFF'
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
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true,
          terminal_colors = true,
        }
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",          -- latte, frappe, macchiato, mocha
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }
  }
}
