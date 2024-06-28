return {
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = function() return vim.g.vscode == nil end,
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'css', 'bash', 'regex', 'lua', 'typescript', 'javascript', 'html', 'scss', 'json', 'xml', 'rust' },
      auto_install = true,
      highlight = {
        enable = true,
        disable = {'html'}
      },
      indent = {
        enable = true
      }
    },
    event = 'BufEnter *.*',
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      -- vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      -- Set fold level to 100 to prevent autofolding on open
      vim.opt.foldlevel = 100
    end

  }
}
