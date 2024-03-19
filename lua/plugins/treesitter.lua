return {
  {
    'p00f/nvim-ts-rainbow',
    -- event = 'LspAttach',
    dependencies = { 'nvim-treesitter/nvim-treesitter', },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    -- lazy = false,
    priority = 1500,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "c", "lua", "bash", "javascript", "cpp", "java", "json", "vim", "query", "markdown","markdown_inline", "html" },
        auto_install = true,
        autopair = {
          enable = true,
        },
        ignore_install = { "" },
        highlight = {
          enable = false,
          additional_vim_regex_highlighting = false,
        },
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end
  }
}
