return {
  {
    'sindrets/diffview.nvim',
    enabled = function() return vim.g.vscode == nil end,
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'BufEnter *.*',
  },
  {
    'APZelos/blamer.nvim',
    event = 'BufEnter *.*',
    enabled = function() return vim.g.vscode == nil end,
    config = function(_, opts)
      -- --Enable Blamer by default
      vim.g.blamer_enabled = 1
      -- --Delay Blamer
      vim.g.blamer_delay = 200
    end
  }
}
