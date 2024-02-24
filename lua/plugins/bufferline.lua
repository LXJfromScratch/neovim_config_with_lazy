return {
  "akinsho/bufferline.nvim",
  event = "BufEnter",
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<A-j>', '<cmd>BufferLineCyclePrev<CR>', mode = 'n', desc = 'BufferLineCyclePrev' },
    { '<A-k>', '<cmd>BufferLineCycleNext<CR>', mode = 'n', desc = 'BufferLineCycleNext' },
    { '<A-,>', '<cmd>BufferLineMovePrev<CR>',  mode = 'n', desc = 'BufferLineMovePrev' },
    { '<A-.>', '<cmd>BufferLineMoveNext<CR>',  mode = 'n', desc = 'BufferLineMoveNext' },
    { '<A-c>', '<cmd>bdelete<CR>',             mode = 'n', desc = '[C]lose buffer' },
    { '<A-J>', '<cmd>bfirst<CR>',              mode = 'n', desc = 'Switch to the begin of bufer line' },
    { '<A-K>', '<cmd>blast<CR>',               mode = 'n', desc = 'Switch to the end of buffer line' },
  },
  config = function()
    require("bufferline").setup {
      options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        -- hover = {
        --   enabled = true,
        --   delay = 200,
        --   reveal = {'close'},
        -- },
      }
    }
  end
}
