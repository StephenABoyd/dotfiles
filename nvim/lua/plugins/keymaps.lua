local bufopts = { noremap=true, silent=true, buffer=false }

-- Leader Key
vim.g.mapleader = ","

-- Keymaps
-- -- File Search (FZF)
vim.keymap.set('n', ';f', ':Telescope find_files<CR>', bufopts)

-- -- Search all file content
vim.keymap.set('n', ';s', ':Telescope live_grep<CR>', bufopts)

-- -- File Browser
vim.keymap.set('n', ';t', ':Telescope file_browser grouped=true cwd=%:p:h select_buffer=true <CR>', bufopts)

-- -- Shortcut window command
vim.keymap.set('n', ';w', '<C-w>', bufopts)

-- -- Emmet
vim.keymap.set('n', ';e', ':Emmet', bufopts)

-- -- Open current folder
-- vim.keymap.set('n', ';s', ':Neotree position=float reveal=true<CR>', bufopts)


-- -- Vim Test
vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', bufopts)
vim.keymap.set('n', '<leader>T', ':TestFile<CR>', bufopts)
vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', bufopts)
vim.keymap.set('n', '<leader>l', ':TestLast<CR>', bufopts)
vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', bufopts)

