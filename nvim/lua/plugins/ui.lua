return {
  {
    'vim-airline/vim-airline',
    enabled = function() return vim.g.vscode == nil end,
    dependencies = { 'vim-airline/vim-airline-themes' }
  },
  'airblade/vim-gitgutter',
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    enabled = function() return vim.g.vscode == nil end,
    config = function() require'fidget'.setup{} end
  },
  {
    'startup-nvim/startup.nvim',
    dependencies = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
    enabled = function() return vim.g.vscode == nil end,
    config = function()
      require'startup'.setup({theme = 'startify'})
    end
  },
  {
    'stevearc/oil.nvim',
    enabled = function() return vim.g.vscode == nil end,
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { ';n', ':Oil --float<CR>', desc = "Open Oil" }
    },
    config = function()
      require('oil').setup({
        view_options = {
          show_hidden = true,
        },
        default_file_explorer = true,
        float = {
          padding = 10,
          border = "rounded",
          preview_split = "auto"
        }
      })
    end
  },
  {
    'folke/trouble.nvim',
    enabled = function() return vim.g.vscode == nil end,
    event = 'BufEnter *.*',
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
}
