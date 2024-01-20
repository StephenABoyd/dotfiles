return {
  {
    'numToStr/Comment.nvim',
    event = 'BufEnter *.*',
    config = function()
        require('Comment').setup()
    end
  },
  {
    'tpope/vim-surround',
    event = 'BufEnter *.*',
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'BufEnter *.html',
    config = function() require'nvim-treesitter.configs'.setup {
      autotag = {
        enable = true,
      }
    }  end
  }
}
