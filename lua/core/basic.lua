-- change word case select ->  U u ~
-- junmp inline   t <character>  or f <character>
-- change number <C-a> <C-x>

local set = vim.opt
set.number = true
set.relativenumber = true

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.mouse = 'a'
set.mousemoveevent = true
set.cursorline = false
set.wrap = false
--set.scroll = 8

set.clipboard:append('unnamedplus') --<C-q> instead <C-v>

-- Search
set.ignorecase = true
set.smartcase = true

-- set.cmdheight = 0

-- Indnet
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.autoindent = true
set.smartindent = true

-- Undo(u) -- Redo (<C-r>)
set.undodir = vim.fn.stdpath("config") .. "/undodir"
set.undofile = true

-- Color Theme --> color.lua
set.termguicolors = true
set.signcolumn = 'yes'

set.conceallevel = 2

-- Fold Code
-- set.foldmethod = "expr"
-- set.foldexpr = "nvim_treesitter#foldexpr()"
-- set.foldenable = false
