local langs = { "pyright", "lua_ls", "bashls", "html", "marksman", "clangd", "sqlls", "vimls", --[[ "gopls" ]] }
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
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
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      for _, lang in ipairs(langs) do
        require("lspconfig")[lang].setup {
          capabilities = capabilities,
        }
      end
    end
  }
}
