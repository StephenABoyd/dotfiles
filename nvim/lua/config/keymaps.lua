if vim.g.vscode then
  -- Nothing
  
  vim.keymap.set('n', ';wl', function ()
    require('vscode-neovim').action('workbench.action.navigateRight')
  end, bufopts)
  vim.keymap.set('n', ';wh', function ()
    require('vscode-neovim').action('workbench.action.navigateLeft')
  end, bufopts)
  vim.keymap.set('n', ';f', function ()
    require('vscode-neovim').action('workbench.action.quickOpen')
  end, bufopts)
  vim.keymap.set('n', ';s', function ()
    require('vscode-neovim').action('workbench.action.findInFiles')
  end, bufopts)
  vim.keymap.set('n', ';n', function ()
    require('vscode-neovim').action('workbench.action.toggleSidebarVisibility')
  end, bufopts)
  vim.keymap.set('n', ',n', function ()
    require('vscode-neovim').action('editor.action.marker.next')
  end, bufopts)
  vim.keymap.set('n', ',p', function ()
    require('vscode-neovim').action('editor.action.marker.prev')
  end, bufopts)
  vim.keymap.set('n', 'gD', function ()
    require('vscode-neovim').action('editor.action.revealDefinition')
  end, bufopts)
  vim.keymap.set('n', 'gI', function ()
    require('vscode-neovim').action('editor.action.goToImplementation')
  end, bufopts)
else
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
end
