return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = '🐥'
      },
      outline = {
        layout = 'float',
        -- win_width = 35,
      },
      finder = {
        default = 'def+ref+imp+tyd',
      },
      diagnostic = {
        max_height = 0.6,
        keys = {
          quit = { 'q', '<ESC>' }
        }
      },
      code_action = {
        keys = {
          quit = { 'q', '<ESC>' }
        }
      },
      rename = {
        in_select = false,
        keys = {
          quit = { '<ESC>' }
        }
      },
      lightbulb = {
        enable = true,
      },
      symbol_in_winbar = {
        enable = false,
        folder_level = 0,
        delay = 200
      }
    })

    vim.diagnostic.config({
      virtual_text = false,
    })

    local signs = { Error = "🍄", Warn = "🐣", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local maplsp = vim.keymap.set
    maplsp('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
    maplsp('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<cr>')
    maplsp("n", "[E", function()
      require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    maplsp("n", "]E", function()
      require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)
    maplsp({ 'n', 't' }, '<A-t>', '<cmd>Lspsaga term_toggle<cr>')
    maplsp('n', '<leader><tab>', vim.diagnostic.open_float)
    maplsp('n', '<leader>le', vim.diagnostic.setloclist)
    maplsp('n', '<leader>o', '<cmd>Lspsaga outline<cr>')
    maplsp('n', '<leader>f', '<cmd>Lspsaga finder<cr>')

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
        maplsp('n', '<leader>h', '<cmd>Lspsaga hover_doc<cr>', optbuf)
        -- maplsp('n', '<leader>d',  '<cmd>Lspsaga peek_type_definition<cr>', optbuf)
        maplsp('n', '<leader>d', '<cmd>Lspsaga peek_definition<cr>', optbuf)
        maplsp('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, optbuf)
        maplsp('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, optbuf)
        maplsp('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, optbuf)
        maplsp('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', optbuf)
        maplsp('n', '<space>rf', vim.lsp.buf.rename, optbuf)
        maplsp('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', optbuf)
        maplsp('n', '<leader>=', function() vim.lsp.buf.format { async = true } end, optbuf)
      end,
    })
  end,
}
