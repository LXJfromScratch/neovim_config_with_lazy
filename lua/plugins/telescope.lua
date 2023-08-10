return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'nvim-lua/popup.nvim',
    "debugloop/telescope-undo.nvim",
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },

  },
  keys = {--telescope
    { '<leader>sf', '<cmd>Telescope find_files<CR>',   mode = 'n', desc = 'Telescope [s]earch [f]iles' },
    { '<leader>sk', '<cmd>Telescope keymaps<CR>',      mode = 'n', desc = 'Telescope [s]earch [k]eymaps' },
    { '<leader>sg', '<cmd>Telescope live_grep<CR>',    mode = 'n', desc = 'Telescope [s]earch and [g]rep contents' },
    { '<leader>sb', '<cmd>Telescope buffers<CR>',      mode = 'n', desc = 'Telescope [s]earch [b]uffers' },
    { '<leader>sh', '<cmd>Telescope help_tags<CR>',    mode = 'n', desc = 'Telescope [s]earch [h]elp documents' },
    { '<leader>so', '<cmd>Telescope oldfiles<CR>',     mode = 'n', desc = 'Telescope [s]earch [o]ld files' },
    { '<leader>su', '<cmd>Telescope undo<CR>',         mode = 'n', desc = 'Telescope [s]earch [u]ndo tree' },
    { '<leader>e',  '<cmd>Telescope file_browser<CR>', mode = 'n', desc = 'Telescope [e]xplorer' },
    {
      '<leader>se',
      '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
      mode = 'n',
      desc = 'Telescope [s]how [e]xplorer'
    },
    {
      '<leader>sp',
      '<cmd>Telescope projects<CR>',
      mode = 'n',
      desc = 'Telescope [s]how [e]xplorer'
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        theme = 'ivy',
        file_ignore_patterns = { "undodir/" },
        -- layout_strategy = "horizontal",
        -- layout_config = {
        --   horizontal = {
        --     width = 0.9,
        --     height = 0.8,
        --     prompt_position = "top",
        --     preview_cutoff = 120,
        --   },
        -- },
        -- sorting_strategy = "ascending",
        mappings = {
          n = {
            ["q"] = require('telescope.actions').close,
            ["<leader>e"] = require('telescope.actions').close
          },
          i = {
            ["<leader>e"] = require('telescope.actions').close,
          }
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        file_browser = {
          -- depth = 3,
          -- grouped = false,
          hidden = true,
          auto_depth = true,
          select_buffer = true,
          -- collapse_dirs = true,
          theme = "ivy",
          -- hijack_netrw = true,
        },
        undo = {

        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
      pickers = {
        find_files = {
          theme = 'ivy',
        },
        keymaps = {
          theme = 'ivy',
        },
        live_grep = {
          theme = 'ivy',
        },
        buffers = {
          theme = 'ivy',
        },
        help_tags = {
          theme = 'ivy',
        },
        oldfiles = {
          theme = 'ivy',
        },
      }
    }


    require('telescope').load_extension('fzf')
    require('telescope').load_extension('undo')
    -- require('telescope').load_extension('dap')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('projects')
    -- require("telescope").load_extension("ui-select")
  end
}
