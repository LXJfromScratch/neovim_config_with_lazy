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
      conf = {
        mode = 'foreground'
      },
      toml = {
        mode = 'foreground'
      },

    }
  end
}
