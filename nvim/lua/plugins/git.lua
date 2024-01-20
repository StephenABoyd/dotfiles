return {
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'BufEnter *.*',
  },
  {
    'APZelos/blamer.nvim',
    event = 'BufEnter *.*',
    config = function(_, opts)
      -- --Enable Blamer by default
      vim.g.blamer_enabled = 1
      -- --Delay Blamer
      vim.g.blamer_delay = 200
    end
  }
}
