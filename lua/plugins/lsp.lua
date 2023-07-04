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
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
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

    local maplsp = vim.keymap.set

    maplsp('n', '[e', vim.diagnostic.goto_prev)
    maplsp('n', ']e', vim.diagnostic.goto_next)
    maplsp('n', '<leader><tab>', vim.diagnostic.open_float)
    maplsp('n', '<leader>le', vim.diagnostic.setloclist)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local optbuf = { buffer = ev.buf }
        maplsp('n', 'gD', vim.lsp.buf.declaration, optbuf)
        maplsp('n', 'gd', vim.lsp.buf.definition, optbuf)
        maplsp('n', 'gi', vim.lsp.buf.implementation, optbuf)
        maplsp('n', 'gr', vim.lsp.buf.references, optbuf)
        -- maplsp('n', '<C-k>', vim.lsp.buf.signature_help, optbuf)
        maplsp('n', '<leader>h', vim.lsp.buf.hover, optbuf)
        maplsp('n', '<leader>d', vim.lsp.buf.type_definition, optbuf)
        maplsp('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, optbuf)
        maplsp('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, optbuf)
        maplsp('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, optbuf)
        maplsp('n', '<leader>rn', vim.lsp.buf.rename, optbuf)
        maplsp('n', '<leader>ca', vim.lsp.buf.code_action, optbuf)
        maplsp('n', '<leader>=', function() vim.lsp.buf.format { async = true } end, optbuf)
      end,
    })
  end
}
