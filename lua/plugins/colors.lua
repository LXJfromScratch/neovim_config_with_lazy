return {
  --[[ {
    'folke/tokyonight.nvim',
    priority = 1000,
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
        variables = { bold = true },
      },
      on_colors = function(colors)
        colors.comment = '#BFEFFF'
        colors.cyan = '#97FFFF'
        colors.fg = '#F8F8FF'
        colors.green = '#C0FF3E'
        colors.green1 = '#00FA9A'
        colors.orange = '#FFA500'
        colors.yellow = '#FFD700'
        colors.fg_dark = '#E0FFFF'
        colors.dark3 = '#98F5FF'
        colors.fg_gutter = '#EE5C42' -- number line
        colors.bg_statusline = '#EE5C42'
        colors.blue1 = '#00F5FF'     -- Java variable color
        colors.blue = '#00BFFF'      -- Java function color
        colors.fg_sidebar = '#000000'
        colors.gitSigns = { add = "#00FF00", change = "#00FFFF", delete = "#FFFF00" }
      end
    }
  }, ]]
  --[[ {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      -- disable_background = true,
      -- disable_float_background = true,
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    }
  }, ]]
  {
    "ellisonleao/gruvbox.nvim",
    -- lazy = true,
    priority = 1500,
    opts = {
      transparent_mode = true,
      bold = true,
      contrast = 'hard',
    },
  },
  --[[ {
    'projekt0n/github-nvim-theme',
    lazy = true,
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
          terminal_colors = true,
          styles = {
            comments = 'italic',
            keywords = 'italic',
            variables = 'bold',
          }
        },
      })
    end
  }, ]]
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      term_colors = true,
      show_end_of_buffer = false,
      integrations = {
        alpha = true,
        cmp = true,
        dap_ui = true,
        gitsigns = true,
        leap = true,
        mason = true,
        treesitter = true,
        lsp_saga = true,
      },
      color_overrides = {
        all = {
          overlay0 = "#B5B5B5" -- Comments
        }
      }
    }
  }
}
