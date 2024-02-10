return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = 'LspAttach',
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      local hl = vim.api.nvim_set_hl
      hl(0, "RainbowRed", { fg = "#E06C75" })
      hl(0, "RainbowYellow", { fg = "#E5C07B" })
      hl(0, "RainbowBlue", { fg = "#61AFEF" })
      hl(0, "RainbowOrange", { fg = "#D19A66" })
      hl(0, "RainbowGreen", { fg = "#98C379" })
      hl(0, "RainbowViolet", { fg = "#C678DD" })
      hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
  end
}
