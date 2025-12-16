local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  { { import = 'pranshuul.plugins' }, { import = 'pranshuul.plugins.themes' }, { import = 'pranshuul.plugins.lsp' } }, {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  })

local colorscheme = 'tokyonight'
require('pranshuul.plugins.themes.' .. colorscheme)
vim.cmd.colorscheme(colorscheme)
