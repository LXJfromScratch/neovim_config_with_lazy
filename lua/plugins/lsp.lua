return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local langs = { "pyright", "lua_ls", "bashls", "html", "marksman", "clangd", "sqlls", "vimls", --[[ "gopls" ]] }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
    })

    require('mason-lspconfig').setup({
      ensure_installed = langs
    })

    for _, lang in ipairs(langs) do
      require("lspconfig")[lang].setup {
        capabilities = capabilities,
      }
    end

  end
}
