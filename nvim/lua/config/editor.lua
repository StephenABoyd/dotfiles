-- set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- show line numbers
vim.opt.number = true

-- ignore casing when searching in a file
vim.opt.ic = false

-- do not wrap text
vim.opt.wrap = false

vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

-- Remove swap files
vim.api.noswapfile = true

vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
})

vim.o.updatetime = 300

if vim.g.vscode then
  -- Nothing
else
  -- Theming
  vim.cmd('set termguicolors')
  vim.g.airline_theme='bubblegum'
  vim.g.airline_section_z='Line %l/%L : %c'
  vim.g.airline_section_y=''

  --[[ vim.cmd.colorscheme "catppuccin" ]]
  --[[ vim.cmd.colorscheme "nord" ]]
  --[[ vim.api.nvim_set_hl(0, "Normal", { ctermfg=NONE,  ctermbg=NONE }) ]]

  -- ESLint configs
  local onSaveGroup = vim.api.nvim_create_augroup("ESLint", { clear = true })
  -- Automatically fix linting on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.tsx","*.ts","*.jsx","*.js"},
    command = "EslintFixAll",
    group = onSaveGroup
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*"},
    command = "retab",
    group = onSaveGroup
  })
end


-- Center on Insert
vim.cmd([[
  augroup insert_center
    autocmd!
    autocmd InsertEnter * normal zz
  augroup end
]])
