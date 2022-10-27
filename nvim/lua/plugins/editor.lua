-- set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2

-- show line numbers
vim.opt.number = true

-- ignore casing when searching in a file
vim.opt.ic = false

-- do not wrap text
vim.opt.wrap = false

vim.opt.undodir = '~/.vim/undo/'
vim.opt.undofile = true

-- Remove swap files
vim.api.noswapfile = true

-- Theming
vim.cmd('set termguicolors')
vim.g['airline_theme'] = 'sonokai'
vim.g['sonokai_enable_italic'] = 1
vim.g['sonokai_diagnostic_text_highlight'] = 1
--vim.cmd('colorscheme sonokai')
--vim.cmd('colorscheme kanagawa')
require('onedark').setup {
	style = 'darker'
}
require('onedark').load()

-- ESLint configs
local eslintGroup = vim.api.nvim_create_augroup("ESLint", { clear = true })
-- Automatically fix linting on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {"*.tsx","*.ts","*.jsx","*.js"},
	command = "EslintFixAll",
	group = eslintGroup
})

-- Center on Insert
vim.cmd([[
  augroup insert_center
    autocmd!
    autocmd InsertEnter * normal zz
  augroup end
]])
