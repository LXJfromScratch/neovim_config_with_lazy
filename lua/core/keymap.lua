local map = function(mode, keys, action, desc)
  vim.keymap.set(mode, keys, action, { noremap = true, silent = true, desc = desc })
end

vim.g.mapleader = ' '
-- map('t', '[', function()
--   vim.api.nvim_feedkeys(' ', 'n', true)
-- end, 'Disable leader key while terminal mode')

map('i', 'jj', '<esc>', 'Quit insert mode')
map('i', 'jk', '<esc>', 'Quit insert mode')

-- move cursor in insert mode
map('i', '<A-l>', '<esc>la', 'Move cursore right')
map('i', '<A-h>', '<esc>ha', 'Move cursor left')

-- save changes
map('n', '<C-s>', '<cmd>w<CR>', 'Save changes')
map('i', '<C-s>', '<cmd>w<CR>', 'Save changes')

-- windows
map('n', '<C-l>', '<cmd>wincmd l<CR>', 'Move cursor to the window right')
map('n', '<C-h>', '<cmd>wincmd h<CR>', 'Move cursor to the window left')
map('n', '<C-j>', '<cmd>wincmd j<CR>', 'Move cursor to the window bottom')
map('n', '<C-k>', '<cmd>wincmd k<CR>', 'Move cursor to the window above')

-- Resize Windows
map('n', '<C-S-Right>', ':vertical resize -1<CR>', 'Resize vertical buffers')
map('n', '<C-S-Left>', ':vertical resize +1<CR>', 'Resize vertical buffers')
map('n', '<C-S-Up>', ':horizontal resize +1<CR>', 'Resize horizontal buffers')
map('n', '<C-S-Down>', ':horizontal resize -1<CR>', 'Resize horizontal buffers')

-- Move Line
map('n', '<A-down>', '<cmd>m +1<CR>', 'Move line down')
map('n', '<A-up>', '<cmd>m -2<CR>', 'Move line up')
map('i', '<A-down>', '<cmd>m +1<CR>', 'Move line down')
map('i', '<A-up>', '<cmd>m -2<CR>', 'Move line up')

-- Move Selections
map('v', '<A-down>', ":m '>+1<CR>gv=gv", 'Move line[s] down')
map('v', '<A-up>', ":m '<-2<CR>gv=gv", 'Move line[s] up')
