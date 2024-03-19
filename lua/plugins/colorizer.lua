return {
  'norcalli/nvim-colorizer.lua',
  event = "VeryLazy",
  config = function ()
    require 'colorizer'.setup{
      lua = {
        mode = 'foreground'
      },
      css = {
        mode = 'foreground'
      },
      toml = {
        mode = 'foreground'
      },

    }
  end
}
