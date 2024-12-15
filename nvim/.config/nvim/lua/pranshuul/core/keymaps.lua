-- Set Leader Key to <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local keymap = vim.keymap

-- Disable leader's default behaviour in normal and Visual Modes
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, noremap = true })
keymap.set('n', '<leader>s', '<Nop>', { silent = true, noremap = true })

-- Quickly exit Insert Mode
keymap.set('i', 'jk', '<ESC>', { silent = true, noremap = true })
keymap.set('i', 'kj', '<ESC>', { silent = true, noremap = true })

-- Save File
keymap.set({ 'n', 'i' }, '<C-s>', '<cmd> w <CR>', { silent = true, noremap = true, desc = 'Save File' })

-- Save File (without formatting)
keymap.set('n', '<leader>sn', '<cmd> noautocmd w <CR>', { silent = true, noremap = true, desc = 'Save File (without formatting)' })

-- Quit Neovim
keymap.set('n', '<C-q>', '<cmd> qa <CR>', { silent = true, noremap = true, desc = 'Quit Neovim' })

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true, noremap = true })

-- Delete/Paste without moving to register
keymap.set('n', 'x', '"_x', { silent = true, noremap = true })
keymap.set('v', 'p', '"_dP', { silent = true, noremap = true })

-- Explicitly yank to system clipboard (highlighted and entire row)
keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank' })

-- Move text up and down
keymap.set('v', '<A-j>', ':m .+1<CR>==gv', { silent = true, noremap = true, desc = 'Move text Down' })
keymap.set('v', '<A-k>', ':m .-2<CR>==gv', { silent = true, noremap = true, desc = 'Move text Up' })

-- Increment/Decrement Numbers
keymap.set('n', '<leader>=', '<C-a>', { silent = true, noremap = true, desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { silent = true, noremap = true, desc = 'Decrement Number' })

-- Vertical scroll and center
keymap.set('n', '<C-d>', '<C-d>zz', { silent = true, noremap = true })
keymap.set('n', '<C-u>', '<C-u>zz', { silent = true, noremap = true })

-- Find and center
keymap.set('n', 'n', 'nzzzv', { silent = true, noremap = true }) -- Next Result
keymap.set('n', 'N', 'Nzzzv', { silent = true, noremap = true }) -- Previous Result

-- Navigate Buffers
keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true, noremap = true })
keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true, noremap = true })

-- Navigate Tabs
keymap.set('n', '<leader>to', "<cmd>tabnew<CR>", { silent = true, noremap = true, desc = 'Open New Tab' })
keymap.set('n', '<leader>tx', "<cmd>tabclose<CR>", { silent = true, noremap = true, desc = 'Close Current Tab' })
keymap.set('n', '<leader>t]', "<cmd>tabn<CR>", { silent = true, noremap = true, desc = 'Next Tab'})
keymap.set('n', '<leader>t[', "<cmd>tabp<CR>", { silent = true, noremap = true, desc = 'Previous Tab' })
keymap.set('n', '<leader>tf', "<cmd>tabnew %<CR>", { silent = true, noremap = true, desc = 'Open Current Buffer in New Tab' })

vim.keymap.set('n', '<leader>bx', ':Bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>bo', '<cmd> enew <CR>', opts) -- new buffer
--
-- Navigate buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Window Management
keymap.set('n', '<leader>s\\', '<C-w>v', { silent = true, noremap = true, desc = 'Split Vertically' })
keymap.set('n', '<leader>s-', '<C-w>s', { silent = true, noremap = true, desc = 'Split Horizontally' })  
keymap.set('n', '<leader>se', '<C-w>=', { silent = true, noremap = true, desc = 'Equalize Splits' })  
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { silent = true, noremap = true, desc = 'Close Split' }) 

-- Window Navigation
keymap.set('n', '<leader>sh', '<C-w>h', { silent = true, noremap = true, desc = 'Move to Left Split' })
keymap.set('n', '<leader>sl', '<C-w>l', { silent = true, noremap = true, desc = 'Move to Right Split' })
keymap.set('n', '<leader>sj', '<C-w>j', { silent = true, noremap = true, desc = 'Move to Lower Split' })
keymap.set('n', '<leader>sk', '<C-w>k', { silent = true, noremap = true, desc = 'Move to Upper Split' })

-- Resize with <C-(Arrows)>
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true, noremap = true })

-- Toggle Line wrap
keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { silent = true, noremap = true, desc = 'Toggle Line Wrapping'})

-- Stay in Visual mode after Indenting
keymap.set('v', '<', '<gv', { silent = true, noremap = true })
keymap.set('v', '>', '>gv', { silent = true, noremap = true })

-- Toggle diagnostics
local diagnostics_active = true

keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end, { desc = 'Open Diagnostics Buffer' })

-- Diagnostic keymaps
keymap.set('n', 'd[', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', 'd]', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
