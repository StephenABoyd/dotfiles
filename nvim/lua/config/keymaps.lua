local bufopts = { noremap=true, silent=true, buffer=false }

-- Leader Key
vim.g.mapleader = ","

-- Keymaps

-- -- Shortcut window command
vim.keymap.set('n', ';w', '<C-w>', bufopts)

-- -- Emmet
vim.keymap.set('n', ';e', ':Emmet', bufopts)

-- lsp signature
vim.keymap.set('n', '<leader>k', function()
 vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)
