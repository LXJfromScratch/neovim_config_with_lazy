return {
  'voldikss/vim-floaterm',
  keys = {
    { '<A-t>', '<cmd>FloatermToggle<CR>', mode = 'n', desc = 'FloatermToggle' },
    { '<A-t>', '<C-\\><C-n><cmd>FloatermToggle<CR>', mode = 't', desc = 'FloatermToggle' },
    { '<A-r>', '<cmd>FloatermNew ranger<CR>', mode = 'n', desc = 'FloatermToggle' },
  }
}
--[[ local M = {} -- 集合，可以通过下面的语法添加方法。
function M.toggleFT(name, cmd)
    if vim.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        vim.api.nvim_command(string.format('exec "FloatermToggle %s"', name))
    else
        vim.api.nvim_command(string.format('FloatermNew --name=%s %s', name, cmd))
    end
end

function M.setup()
end

return M ]]
