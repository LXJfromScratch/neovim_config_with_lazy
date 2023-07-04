return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      'rcarriga/nvim-dap-ui',
      opts = {
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't'
        },
        layouts = {
          {
            elements = {
              'scopes',
              'breakpoints',
              'stacks',
              'watches'
            },
            size = 0.2,
            position = 'left'
          },
          {
            elements = {
              'repl',
              'console'
            },
            size = 0.2,
            position = 'bottom'
          },
          floating = {
            max_height = nil,
            max_width = nil,
            border = "single",
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
        },
      },
      config = function(_, opts)
        local dap, dapui = require "dap", require "dapui"
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        -- dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        -- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        dapui.setup(opts)
      end
    }
  },
  keys = {
    { "<f9>",           "<cmd>lua require('dap').toggle_breakpoint()<cr>",                                           desc = 'Toggle [B]reakpoint' },
    { "<leader>bc",     "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))",            desc = '[B]reakpoint [C]ondition' },
    { "<leader>bl",     "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", desc = '[B]reakpoint [L]og' },
    { '<leader>br',     "<cmd>lua require('dap').clear_breakpoints()<cr>",                                           desc = '[B]reakpoint clea[R]' },
    { "<f5>",           "<cmd>lua require('dap').continue()<cr>",                                                    desc = '[D]ebug [C]ontinue' },
    { "<f10>",          "<cmd>lua require('dap').step_over()<cr>",                                                   desc = ' ' },
    { "<f11>",          "<cmd>lua require('dap').step_into()<cr>",                                                   desc = ' ' },
    { "<learder><f11>", ":lua require('dap').step_out()<cr>",                                                        desc = ' ' },
    { '<leader>dd',     "<cmd>lua require('dap').disconnect()<cr>",                                                  desc = '[D]ebug [D]isconnect' },
    { '<leader>dt',     "<cmd>lua require('dap').terminate()<cr>",                                                   desc = ' ' },
    { "<leader>dr",     "<cmd>lua require('dap').repl.toggle()<cr>",                                                 desc = '[D]ebug [R]epl' },
    { "<leader>dl",     "<cmd>lua require('dap').run_last()<cr>",                                                    desc = ' ' },
    { "<leader>du",     "<cmd>lua require('dapui').toggle()<cr>",                                                    desc = '[D]ebug [U]i' },
  },
}
