require('core.basic')
require('core.keymap')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  import = 'plugins',
})

function MyColor(color)
  color = color or 'tokyonight-moon'
  vim.cmd.colorscheme(color)
end

MyColor()
-- MyColor('github_dark_high_contrast')

--[[ local home = os.getenv("HOME")
if home == "/root"
then
  MyColor('rose-pine')
else
  MyColor('catppuccin-mocha')
end ]]

