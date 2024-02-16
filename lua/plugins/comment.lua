return {
  "numToStr/Comment.nvim",
  event = 'LspAttach',
  config = function()
    require('Comment').setup()
  end
}
