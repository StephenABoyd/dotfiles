return {
  {
    'nvim-telescope/telescope.nvim',
    enabled = function() return vim.g.vscode == nil end,
    version = '0.1.2',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
      { ';f', ':Telescope find_files<CR>', desc = 'Find Files in Telescope' },
      { ';s', ':Telescope live_grep<CR>', desc = 'Search Files in Telescope' },
      { ';t', ':Telescope file_browser grouped=true cwd=%:p:h select_buffer=true <CR>', desc = 'View Relative Files in Telescope' }
    },
    config = function()
      require('telescope').setup{
        extensions = {
          file_browser = {
            files = false
          }
        }
      }
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    enabled = function() return vim.g.vscode == nil end,
    config = function() require('telescope').load_extension 'file_browser' end,
    dependencies = { {'nvim-telescope/telescope.nvim'} },
  }
}
