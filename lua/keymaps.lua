-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- throw selected words to void
-- vim.keymap.set({ 'v' }, 'p', '\"_d\"\"p')
-- vim.keymap.set({ 'v' }, 'P', '\"_d\"\"P')
vim.keymap.set({ 'v', 'n' }, '\\', '"+')

-- idk, i was told not to use the basic 'Q' function no matter what
vim.keymap.set({ 'n' }, 'Q', 'gq')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<C-y>', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<C-e>', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Oil
vim.keymap.set('n', '<leader>pv', ':Oil<CR>', { desc = 'Oil' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local oil = require('oil')
vim.keymap.set('n', '<leader>fl', oil.toggle_float)
vim.keymap.set('n', '<leader>fL', oil.open_float)

-- vim: ts=2 sts=2 sw=2 et
