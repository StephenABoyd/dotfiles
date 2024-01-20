return {
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' }
  },
  'airblade/vim-gitgutter',
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function() require'fidget'.setup{} end
  },
  {
    'startup-nvim/startup.nvim',
    dependencies = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
    config = function()
      require'startup'.setup({theme = 'startify'})
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    version = 'nightly', -- optional, updated every week. (see issue #1193)
    keys = {
      { ';n', ':NvimTreeToggle<CR>', desc = 'Toggle Nvim Tree' }
    },
    config = function() require('nvim-tree').setup({
      view = {
        adaptive_size = true
      },
      --[[ filters = {
        custom = { 'tsconfig.*\\.json', '\\.eslintrc.*', 'README\\.md', 'jest\\.config.*', 'project\\.json', 'test-setup.*', '\\.storybook' }
      }, ]]
      renderer = {
        group_empty = true
      }
    }) end
  },
  {
    'folke/trouble.nvim',
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
