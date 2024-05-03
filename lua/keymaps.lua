-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- idk, i was told not to use the basic 'Q' function no matter what
-- vim.keymap.set({ 'n' }, 'Q', '<nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move statement up (K) and down (J)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

-- Void put
-- vim.keymap.set('x', '<leader>p', "\"_dP")

vim.keymap.set({'v', 'n'}, '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Use when you are ready for quickfixes
-- vim.keymap.set('n', 'TODO', "<cmd>cnext<CR>zz")
-- vim.keymap.set('n', 'TODO', "<cmd>cprev<CR>zz")
-- vim.keymap.set('n', 'TODO', "<cmd>lnext<CR>zz")
-- vim.keymap.set('n', 'TODO', "<cmd>lprev<CR>zz")

-- find and replace in file
vim.keymap.set('n', '<leader>ra', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "[R]place [A]ll" })
vim.keymap.set('n', '<leader>R', ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "[R]place till Drop" })
vim.keymap.set('n', '<leader>rc', ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI<Left><Left><Left><Left>",
  { desc = "[R]place and [C]onfirm" })

-- Diagnostic keymaps
vim.keymap.set('n', '<C-y>', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<C-e>', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

-- Oil
local oil = require'oil'
vim.keymap.set('n', '<leader>pv', oil.toggle_float, { desc = 'Oil' })

-- vim: ts=2 sts=2 sw=2 et
