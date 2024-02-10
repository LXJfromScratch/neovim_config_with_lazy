return {
  {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', },
    keys = {
      { '<leader>sdc', '<cmd>Telescope dap commands<CR>', mode = 'n', desc = 'Telescope [s]earch [d]ap [c]ommands' },
    },
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', },
    keys = {
      { '<leader>su', '<cmd>Telescope undo<CR>', mode = 'n', desc = 'Telescope [s]earch [u]ndo tree' },
    },
  },
  --[[ {
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = true,
    dependencies = { 'nvim-telescope/telescope.nvim', },
  }, ]]
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', },
    keys = {
      { '<leader>se', '<cmd>Telescope file_browser<CR>', mode = 'n', desc = 'Telescope [e]xplorer' },
      {
        '<leader>e',
        '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
        mode = 'n',
        desc = 'Telescope [s]how [e]xplorer'
      },
    },
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', },
    keys = {
      { '<leader>sm', '<cmd>Telescope media_files<CR>', mode = 'n', desc = 'Telescope [s]earch [m]edia' },
    }
  },
  {
    'ahmedkhalf/project.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', },
    keys = {
      {
        '<leader>sp',
        '<cmd>Telescope projects<CR>',
        mode = 'n',
        desc = 'Telescope [s]how [p]rojects'
      },
    },
    config = function()
      require("project_nvim").setup {
      }
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },

    },
    keys = { --telescope
      { '<leader>sf', '<cmd>Telescope find_files<CR>', mode = 'n', desc = 'Telescope [s]earch [f]iles' },
      { '<leader>sk', '<cmd>Telescope keymaps<CR>',    mode = 'n', desc = 'Telescope [s]earch [k]eymaps' },
      { '<leader>sg', '<cmd>Telescope live_grep<CR>',  mode = 'n', desc = 'Telescope [s]earch and [g]rep contents' },
      { '<leader>sb', '<cmd>Telescope buffers<CR>',    mode = 'n', desc = 'Telescope [s]earch [b]uffers' },
      { '<leader>sh', '<cmd>Telescope help_tags<CR>',  mode = 'n', desc = 'Telescope [s]earch [h]elp documents' },
      { '<leader>so', '<cmd>Telescope oldfiles<CR>',   mode = 'n', desc = 'Telescope [s]earch [o]ld files' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          -- theme = 'ivy',
          file_ignore_patterns = { "undodir/" },
          mappings = {
            n = {
              ["q"] = require('telescope.actions').close,
              ["<leader>e"] = require('telescope.actions').close
            },
            i = {
              ["<leader>e"] = require('telescope.actions').close,
            }
          },
          sorting_strategy = "ascending",
          layout_strategy = "bottom_pane",
          layout_config = {
            height = 25,
          },
          border = true,
          borderchars = {
            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
            results = { " " },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- theme = "ivy"
          },
          file_browser = {
            -- depth = 3,
            -- grouped = false,
            hidden = true,
            auto_depth = true,
            select_buffer = true,
            -- collapse_dirs = true,
            -- theme = "ivy",
            -- hijack_netrw = true,
          },
          undo = {
            -- theme = "ivy"
          },
          ["ui-select"] = {
            -- require("telescope.themes").get_dropdown {},
            -- theme = "ivy"
          },
          extensions = {
            media_files = {
              -- filetypes whitelist
              -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
              filetypes = { "png", "webp", "jpg", "jpeg" },
              -- find command (defaults to `fd`)
              find_cmd = "rg"
            }
          },
        },
        pickers = {
          find_files = {
            -- theme = 'ivy',
          },
          keymaps = {
            -- theme = 'ivy',
          },
          live_grep = {
            -- theme = 'ivy',
          },
          buffers = {
            -- theme = 'ivy',
          },
          help_tags = {
            -- theme = 'ivy',
          },
          oldfiles = {
            -- theme = 'ivy',
          },
        }
      }
    end
  }
}
