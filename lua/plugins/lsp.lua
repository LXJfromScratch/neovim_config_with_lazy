local langs = { "pyright", "lua_ls", "cssls", "bashls", "html", "marksman", "clangd", "sqlls", "vimls", --[[ "gopls" ]] }
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

      --[[ local on_attach = function(client, bufnr)
        local map = function(mode, key, action, opts)
          opts = opts or {}
          opts.silent = true
          opts.buffer = bufnr
          vim.keymap.set(mode, key, action, opts)
        end

        map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
        map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>')
        map("n", "[E", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end)
        map("n", "]E", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end)
        map({ 'n', 't' }, '<A-t>', '<cmd>Lspsaga term_toggle<cr>')
        map('n', '<leader><tab>', vim.diagnostic.open_float)
        map('n', '<leader>le', vim.diagnostic.setloclist)
        map('n', '<leader>o', '<cmd>Lspsaga outline<cr>')
        map('n', '<leader>f', '<cmd>Lspsaga finder<cr>')


      end ]]

      -- require("lspconfig")['lua_ls'].setup {
      --   capabilities = capabilities,
      --   single_file_support = true,
      --   settings = {
      --     Lua = {
      --       completion = {
      --         enable = true,
      --         showWord = "Enable",
      --         callSnippet = "Both",
      --         keywordSnippet = "Replace",
      --
      --       }
      --     }
      --   }
      -- }

      for _, lang in ipairs(langs) do
        require("lspconfig")[lang].setup {
          capabilities = capabilities,
          -- single_file_support = true,
        }
      end
    end
  }
}
