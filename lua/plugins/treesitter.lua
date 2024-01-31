return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  priority = 1000,
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "rust", "c", "lua", "bash", "javascript", "cpp", "java", "json", "vim", "query", "markdown", "html" },
      auto_install = true,

      autopair = {
        enable = true,
      },

      ignore_install = { "" },

      highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
      },
    }
  end
}
